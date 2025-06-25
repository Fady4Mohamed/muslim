import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'qiblah_state.dart';

class QiblahCubit extends Cubit<QiblahState> {
  QiblahCubit() : super(QiblahInitial());

  StreamSubscription? _qiblahSubscription; 

  Future<void> getQiblaDirection() async {
    emit(QiblahLoading());

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(QiblahError("Location permission denied."));
          return;
        }
      }

      _qiblahSubscription?.cancel();

      _qiblahSubscription =
          FlutterQiblah.qiblahStream.listen((qiblahDirection) {
        emit(QiblahLoaded(qiblahDirection.qiblah));
      });
    } catch (e) {
      emit(QiblahError("Error getting Qibla direction: $e"));
    }
  }

  @override
  Future<void> close() {
    _qiblahSubscription?.cancel();
    return super.close();
  }
}
