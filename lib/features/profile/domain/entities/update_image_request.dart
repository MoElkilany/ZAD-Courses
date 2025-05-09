import 'dart:io';

import 'package:equatable/equatable.dart';

class UpdateImageRequest extends Equatable {
  final File image;

  const UpdateImageRequest({required this.image});

  @override
  List<Object?> get props => [image.path];
}
