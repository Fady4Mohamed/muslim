import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/app/featuers/notification/data/repositories/notification_repo_impl.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepoImpl _notificationRepo;

  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  Future<void> initializeNotifications() async {
    emit(NotificationLoading());
    try {
      await _notificationRepo.initialize();
      emit(NotificationLoaded(isInitialized: _notificationRepo.isInitialized));
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    String? body,
    required DateTime scheduledTime,
  }) async {
    try {
      await _notificationRepo.scheduleNotification(
        id: id,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
      );
      emit(NotificationScheduled(message: 'Notification scheduled for $title'));
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }

  Future<void> cancelNotification(int id) async {
    try {
      await _notificationRepo.cancelNotification(id);
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }

  Future<void> cancelAllNotifications() async {
    try {
      await _notificationRepo.cancelAllNotifications();
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }
}
