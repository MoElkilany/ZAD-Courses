import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';
import 'app_settings.dart';
import '../features/authentication/domain/usecases/auto_login.dart';
import '../features/authentication/domain/usecases/is_authenticated.dart';
import '../features/authentication/domain/usecases/refresh_token.dart';
import '../features/authentication/domain/usecases/verify_email.dart';

import '../core/platform/network_info.dart';
import '../features/authentication/data/data_sources/authentication_local_data_source.dart';
import '../features/authentication/data/data_sources/authentication_remote_data_source.dart';
import '../features/authentication/data/models/login/hive/login_response_model.dart';
import '../features/authentication/data/repositories/authentication_repository_impl.dart';
import '../features/authentication/domain/repositories/authentication_repository.dart';
import '../features/authentication/domain/usecases/login.dart';
import '../features/authentication/domain/usecases/logout.dart';
import '../features/authentication/domain/usecases/register.dart';
import 'external_services.dart';

class AuthenticationDI {
  static Future<List<Override>> init() async {
    return [
      AuthenticationDI.localDataSource.overrideWithValue(
        await AuthenticationDI.initLocalDataSource(),
      ),
    ];
  }

  ///////////////////////////////\
  /// data sources //////////////\\
  ///////////////////////////////\\\
  static final localDataSource = Provider<AuthenticationLocalDataSource>((ref) {
    throw UnimplementedError();
  });
  static Future<AuthenticationLocalDataSourceImpl> initLocalDataSource() async {
    Hive.registerAdapter(LoginResponseHiveModelAdapter());
    final authenticationBox = await Hive.openBox<LoginResponseHiveModel>(
      AuthenticationLocalDataSource.authenticationBoxName,
    );
    return AuthenticationLocalDataSourceImpl(authenticationBox);
  }

  static final remoteDataSource = Provider<AuthenticationRemoteDataSource>((ref) {
    final dio = ref.read(ExternalServices.dio);
    return AuthenticationRemoteDataSourceImpl(
      dio: dio,
      settingsRepository: ref.read(AppSettingsDI.settingsRepository),
    );
  });

  ///////////////////////////////\
  /// data repository  //////////\\
  ///////////////////////////////\\\
  static final authenticationReposiroty = Provider<AuthenticationReposiroty>((ref) {
    final local = ref.watch(localDataSource);
    final remote = ref.read(remoteDataSource);
    final ninfo = ref.read(networkInfo);

    return AuthenticationReposirotyImpl(
      authenticationLocalDataSource: local,
      authenticationRemoteDataSource: remote,
      networkInfo: ninfo,
    );
  });
  ///////////////////////////////\
  /// usecases     //////////////\\
  ///////////////////////////////\\\
  static final refreshToken = Provider<RefreshToken>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    final dio = ref.read(ExternalServices.dio);
    return RefreshToken(
      authenticationReposiroty: repo,
      dio: dio,
    );
  });
  static final login = Provider<Login>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    final dio = ref.read(ExternalServices.dio);

    final settingsRepo = ref.watch(AppSettingsDI.settingsRepository);
    return Login(
      authenticationReposiroty: repo,
      dio: dio,
      settingsRepository: settingsRepo,
    );
  });
  static final autoLogin = Provider<AutoLogin>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    final dio = ref.read(ExternalServices.dio);
    final refreshToken = ref.read(AuthenticationDI.refreshToken);

    return AutoLogin(
      authenticationReposiroty: repo,
      dio: dio,
      refreshToken: refreshToken,
    );
  });
  static final logout = Provider<Logout>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    final dio = ref.read(ExternalServices.dio);
    return Logout(
      authenticationReposiroty: repo,
      dio: dio,
    );
  });
  static final register = Provider<Register>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    return Register(
      authenticationReposiroty: repo,
    );
  });
  static final verfiyEmail = Provider<VerifyEmail>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    return VerifyEmail(
      authenticationReposiroty: repo,
    );
  });
  static final isAuthenticated = Provider<IsAuthenticated>((ref) {
    final repo = ref.watch(authenticationReposiroty);
    return IsAuthenticated(
      authenticationReposiroty: repo,
    );
  });
}
