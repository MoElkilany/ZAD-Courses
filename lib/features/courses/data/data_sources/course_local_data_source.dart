import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/course_model.dart';
import '../../domain/entities/course.dart';

/// An abstract class that defines the methods to be implemented by the CourseLocalDataSourceImpl class.
abstract class CourseLocalDataSource {
  /// Retrieves a course from the local data source.
  ///
  /// Throws a [CacheException] if the course is not found in the local data source.
  Future<Course> getCourses(int courseId);

  /// Caches a course in the local data source.
  ///
  /// The [courseId] parameter is used as the key to store the course in the local data source.
  Future<void> cacheCourses(
    int courseId,
    Course course,
  );
}

/// A concrete implementation of the [CourseLocalDataSource] interface.
class CourseLocalDataSourceImpl implements CourseLocalDataSource {
  /// The name of the Hive box used to store the courses.
  static String learningBoxName = 'learning_box';

  /// The prefix used to generate the keys for the courses in the Hive box.
  static const tokenName = 'learning_course_id_';

  /// The Hive box used to store the courses.
  final Box learningBox;

  /// Creates a new instance of the [CourseLocalDataSourceImpl] class.
  ///
  /// The [learningBox] parameter is the Hive box used to store the courses.
  CourseLocalDataSourceImpl(
    this.learningBox,
  );

  @override
  Future<Course> getCourses(int courseId) async {
    final fullToken = tokenName + courseId.toString();
    final Map<String, dynamic>? course = await learningBox.get(fullToken) as Map<String, dynamic>?;
    if (course != null) {
      return CourseModel.fromJson(course);
    } else {
      throw CacheException(status: 500, message: 'Cache Error');
    }
  }

  @override
  Future<void> cacheCourses(int courseId, Course course) async {
    final fullToken = tokenName + courseId.toString();
    final courseModel = CourseModel(
      courseContents: course.courseContents,
      courseQuizzes: course.courseQuizzes,
      certificate: course.certificate,
    );
    final courseString = courseModel.toJson();
    return await learningBox.put(fullToken, courseString);
  }
}
