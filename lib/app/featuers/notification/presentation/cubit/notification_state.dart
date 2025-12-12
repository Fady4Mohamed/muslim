part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final bool isInitialized;

  const NotificationLoaded({required this.isInitialized});

  @override
  List<Object> get props => [isInitialized];
}

class NotificationScheduled extends NotificationState {
  final String message;

  const NotificationScheduled({required this.message});

  @override
  List<Object> get props => [message];
}

class NotificationError extends NotificationState {
  final String error;

  const NotificationError({required this.error});

  @override
  List<Object> get props => [error];
}
