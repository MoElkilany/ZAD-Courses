import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/app_settings.dart';
import '../../domain/entities/zad_notification.dart';

part 'notifications.g.dart';

@Riverpod(keepAlive: true)
Future<Either<Failure, List<ZadNotification>>> getZadNotification(
  Ref ref,
) async {
  final getNotifications = ref.read(AppSettingsDI.getNotifications);
  final res = await getNotifications.call(NoParameters());
  final notificationList = res.fold((l) => <ZadNotification>[], (r) => r);
  ref.read(notificationsListProvider.notifier).setList(notificationList);
  return res;
}

@riverpod
Future<Either<Failure, bool>> markNotificationRead(
  MarkNotificationReadRef ref, {
  required int notificationId,
}) {
  return ref.read(AppSettingsDI.markNotificationRead).call(notificationId);
}

@Riverpod(keepAlive: true)
class NotificationsList extends _$NotificationsList {
  @override
  List<ZadNotification> build() {
    return [];
  }

  void setList(List<ZadNotification> list) {
    state = list;
  }

  void setRead(int id) {
    final index = state.indexWhere((element) => element.id == id);
    if (index != -1) {
      state[index] = state[index].copyWith(status: 'read');
    }
  }

  /// Returns the current couse id.
  get getList => state;
}
