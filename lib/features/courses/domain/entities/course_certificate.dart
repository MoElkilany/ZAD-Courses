import 'package:equatable/equatable.dart';

/// A class representing a course certificate entity.
class CourseCertificate extends Equatable {
  /// The title of the course certificate.
  final String title;

  /// The URL of the course certificate.
  final String url;

  /// The status of the course certificate.
  final String status;

  /// Creates a new instance of [CourseCertificate].
  ///
  /// [title] is the title of the course certificate.
  ///
  /// [url] is the URL of the course certificate.
  ///
  /// [status] is the status of the course certificate.
  const CourseCertificate({
    required this.title,
    required this.url,
    required this.status,
  });

  @override
  List<Object?> get props => [title, url, status];
}
