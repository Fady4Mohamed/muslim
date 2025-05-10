import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:muslim/app/core/api/api_service.dart';
import 'package:muslim/app/core/error/failure.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/data/models/prayer_model/prayer_model.dart';
import 'package:muslim/app/featuers/prayer/data/models/prayer_model/timings.dart';
import 'package:muslim/app/featuers/prayer/data/repos/prayer_repo.dart';

class PrayerRepoImpl implements PrayerRepo {
  final ApiServices apiServices;
  String? date , hijri ;
  PrayerRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<PrayEntityModel>>> fetchPrayerDrtails() async {
    log("11110");
    try {
      log("22220");
      var data = await apiServices.get(queryParameters: {"address": "الاسكندرية,مصر"}, endPoint: "/timingsByAddress");

      log("33330");
      List<PrayEntityModel> prayesEntity = [];

      PrayerModel prayerModel = PrayerModel.fromJson(data);
      date = prayerModel.data!.date!.readable;
      hijri = prayerModel.data!.date!.hijri!.date;
      Timings prayerModell = prayerModel.data!.timings!;
      prayesEntity.add(PrayEntityModel(
          time: prayerModell.fajr!, name: "Fajr", sun: "Down", image: "assets/images/Cloudy-clear at times1.png"));
      prayesEntity.add(PrayEntityModel(
          time: prayerModell.dhuhr!, name: "Dhuhr", sun: "Noon", image: "assets/images/Cloudy-clear at times2.png"));
      prayesEntity.add(PrayEntityModel(
          time: prayerModell.asr!, name: "Asr", sun: "AfterNoon", image: "assets/images/Cloudy-clear at times3.png"));
      prayesEntity.add(PrayEntityModel(
          time: prayerModell.maghrib!,
          name: "Maghrib",
          sun: "Sunset",
          image: "assets/images/Cloudy-clear at times1.png"));
      prayesEntity.add(PrayEntityModel(
          time: prayerModell.isha!, name: "Isha", sun: "Night", image: "assets/images/Cloudy-clear at times2.png"));

      return right(prayesEntity);
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
