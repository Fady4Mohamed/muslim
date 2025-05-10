import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  final int? imsak;
  final int? fajr;
  final int? sunrise;
  final int? dhuhr;
  final int? asr;
  final int? maghrib;
  final int? sunset;
  final int? isha;
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
      Map<String, dynamic> json) {
    return Offset(
      imsak: json['Imsak'] as int?,
      fajr: json['Fajr'] as int?,
      sunrise: json['Sunrise'] as int?,
      dhuhr: json['Dhuhr'] as int?,
      asr: json['Asr'] as int?,
      maghrib: json['Maghrib'] as int?,
      sunset: json['Sunset'] as int?,
      isha: json['Isha'] as int?,
      midnight: json['Midnight'] as int?,
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'Imsak': imsak,
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Sunset': sunset,
      'Isha': isha,
      'Midnight': midnight,
    };
  }

  @override
  List<Object?> get props {
    return [
      imsak,
      fajr,
      sunrise,
      dhuhr,
      asr,
      maghrib,
      sunset,
      isha,
      midnight,
    ];
  }
}
