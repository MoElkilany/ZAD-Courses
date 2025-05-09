// import 'dart:convert';

import '../../domain/entities/home_info.dart';
import '../models/home_info_model.dart';

// final homeInformationLocalDataSource =
//     Provider<HomeInformationLocalDataSource>((ref) {
//   final prefs = ref.watch(ExternalServices.prefs);
//   return HomeInformationLocalDataSourceImpl(prefs);
// });

abstract class HomeInformationLocalDataSource {
  static const cachedHomeInfo = 'CACHED_HOME_INFO';
  Future<HomeInformation> getLastHomeInformation();
  Future<bool> cacheHomeInformation(HomeInformationModel homeInformation);
}

class HomeInformationLocalDataSourceImpl
    implements HomeInformationLocalDataSource {
  // final SharedPreferences sharedPreferences;

  HomeInformationLocalDataSourceImpl(
      // this.sharedPreferences,
      );

  @override
  Future<bool> cacheHomeInformation(
      HomeInformationModel homeInformation) async {
    // final data = json.encode(homeInformation.toJson());
    // return await sharedPreferences.setString(
    //     HomeInformationLocalDataSource.cachedHomeInfo, data);
    throw UnimplementedError();
  }

  @override
  Future<HomeInformation> getLastHomeInformation() async {
    // final res = sharedPreferences
    //     .getString(HomeInformationLocalDataSource.cachedHomeInfo);
    // if (res != null) {
    //   final jsonMap = json.decode(res);
    //   return Future.value(
    //     HomeInformationModel.fromJson(jsonMap),
    //   );
    // } else {
    //   throw CacheException(
    //     status: 404,
    //     message: 'No Cached Home Information Found',
    //   );
    // }
    throw UnimplementedError();
  }
}
