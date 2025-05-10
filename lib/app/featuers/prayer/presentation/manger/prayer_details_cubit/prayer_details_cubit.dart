import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_widget/home_widget.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/data/repos/prayer_repo_impl.dart';

part 'prayer_details_state.dart';

class PrayerDetailsCubit extends Cubit<PrayerDetailsCubitState> {
  PrayerDetailsCubit(this.prayerRepoImpl) : super(PrayerDetailsCubitLoading());

  final PrayerRepoImpl prayerRepoImpl;

  Future<void> fetchPrayerDetails() async {
    emit(PrayerDetailsCubitLoading());
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Check for permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var result = await prayerRepoImpl.fetchPrayerDrtails(
        lat: position.latitude, long: position.longitude);
    result.fold(
      (fauilre) {
        emit(
          PrayerDetailsCubitFauilre(errMessage: fauilre.errMessage),
        );
      },
      (prayers) {
        updatePrayerTimes(prayers);
        emit(
          PrayerDetailsCubitSuccess(prayers),
        );
      },
    );
  }

void updatePrayerTimes(List<PrayEntityModel> prayers) {
  HomeWidget.saveWidgetData<String>('date',prayerRepoImpl.date!); 
  HomeWidget.saveWidgetData<String>('fajr', prayers[0].time);
  HomeWidget.saveWidgetData<String>('Isha', prayers[4].time);
  HomeWidget.saveWidgetData<String>('dhuhr', prayers[1].time);
  HomeWidget.saveWidgetData<String>('asr', prayers[2].time);
  HomeWidget.saveWidgetData<String>('maghrib', prayers[3].time);

  HomeWidget.updateWidget(name: 'MyHomeWidgetProvider');
}

}