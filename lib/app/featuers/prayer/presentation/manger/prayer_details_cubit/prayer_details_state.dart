part of 'prayer_details_cubit.dart';

sealed class PrayerDetailsCubitState extends Equatable {
  const PrayerDetailsCubitState();

  @override
  List<Object> get props => [];
}

final class PrayerDetailsCubitInitial extends PrayerDetailsCubitState {}

final class PrayerDetailsCubitLoading extends PrayerDetailsCubitState {}

final class PrayerDetailsCubitFauilre extends PrayerDetailsCubitState {
  final String errMessage;

  const PrayerDetailsCubitFauilre({required this.errMessage});
}

final class PrayerDetailsCubitSuccess extends PrayerDetailsCubitState {
  final List<PrayEntityModel> prayers;

  const PrayerDetailsCubitSuccess(this.prayers);
}
