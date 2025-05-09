part of 'qiblah_cubit.dart';

@immutable
sealed class QiblahState {}

class QiblahInitial extends QiblahState {}

class QiblahLoading extends QiblahState {}

class QiblahLoaded extends QiblahState {
  final double qiblahDirection;
  QiblahLoaded(this.qiblahDirection);
}

class QiblahError extends QiblahState {
  final String message;
  QiblahError(this.message);
}
