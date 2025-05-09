import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_info.dart';

abstract class HomeInformationRepository {
  Future<Either<Failure, HomeInformation>> getHomeInformation();
}
