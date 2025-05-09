import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/home_info.dart';

@immutable
class HomeInfoState {
  final bool hasError;
  final HomeInformation? homeInfo;
  final String? errorMessage;

  HomeInfoState({required this.hasError, this.homeInfo, this.errorMessage}) {
    if (!hasError && homeInfo == null) {
      throw ValueException(
        messgae: 'hasError is false',
        variableName: 'homeInfo',
        value: homeInfo,
      );
    }
    if (hasError && errorMessage == null) {
      throw ValueException(
        messgae: 'hasError is false',
        variableName: 'errorMessage',
        value: errorMessage,
      );
    }
  }
}
