import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/data/repos/prayer_repo_impl.dart';

part 'prayer_details_state.dart';

class PrayerDetailsCubit extends Cubit<PrayerDetailsCubitState> {
  PrayerDetailsCubit(this.prayerRepoImpl) : super(PrayerDetailsCubitLoading());

  final PrayerRepoImpl prayerRepoImpl;

  Future<void> fetchPrayerDetails() async {
    emit(PrayerDetailsCubitLoading());
    var result = await prayerRepoImpl.fetchPrayerDrtails();
    result.fold(
      (fauilre) {
        emit(
          PrayerDetailsCubitFauilre(errMessage: fauilre.errMessage),
        );
      },
      (prayers) {
        emit(
          PrayerDetailsCubitSuccess(prayers),
        );
      },
    );
  }
}
