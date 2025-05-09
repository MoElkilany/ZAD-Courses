import 'package:equatable/equatable.dart';

class UpdateProfileRequest extends Equatable {
  final String language;
  final String fullName;

  const UpdateProfileRequest({
    required this.language,
    required this.fullName,
  });
  @override
  List<Object?> get props => [language, fullName];
}
