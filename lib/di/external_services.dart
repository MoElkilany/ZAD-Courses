// import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod/riverpod.dart';
import 'package:zad_test/core/config/endpoints.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ExternalServices {
  // static final prefs = Provider<Hive>((ref) {
  //   throw UnimplementedError();
  // });

  static final dio = Provider((ref) {
    final d = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    //COMMENT THIS OUT IN PRODUCTION
    //^ START OF AREA TO COMMENT OUT
    // (d.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    //   HttpClient client = HttpClient();
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    //^ END OF AREA TO COMMENT OUT

    return d;
  });

  static final connectivity = Provider((ref) => Connectivity());

  static final internectConnectionChecker = Provider((ref) => InternetConnectionChecker());
}
