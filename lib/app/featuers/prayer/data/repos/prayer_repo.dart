import 'package:dartz/dartz.dart';
import 'package:muslim/app/core/error/failure.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';

abstract class PrayerRepo {
  Future<Either<Failure, List<PrayEntityModel>>> fetchPrayerDrtails({
  required  double lat,
  required  double long,
  });
}
