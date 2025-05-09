import '../../domain/entities/course_certificate.dart';

/// A model class representing a course certificate.
class CourseCertificateModel extends CourseCertificate {
  /// Creates a [CourseCertificateModel] instance.
  ///
  /// [title], [url], and [status] are required parameters.
  const CourseCertificateModel({
    required super.title,
    required super.url,
    required super.status,
  });

  /// Creates a [CourseCertificateModel] instance from a JSON object.
  ///
  /// The JSON object must have the following keys: 'title', 'url', and 'status'.
  factory CourseCertificateModel.fromJson(Map<String, dynamic> json) {
    return CourseCertificateModel(
      title: json['title'],
      url: json['url'],
      status: json['status'],
    );
  }

  /// Converts this [CourseCertificateModel] instance to a JSON object.
  ///
  /// The returned JSON object will have the following keys: 'title', 'url', and 'status'.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'status': status,
    };
  }
}
