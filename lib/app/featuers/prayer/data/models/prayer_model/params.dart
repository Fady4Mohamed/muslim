import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final double? fajr;
  final double? isha;

  const Params({this.fajr, this.isha});

  factory Params.fromCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
      Map<String, dynamic> json) {
    return Params(
      fajr: (json['Fajr'] as num?)?.toDouble(),
      isha: (json['Isha'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'Fajr': fajr,
      'Isha': isha,
    };
  }

  @override
  List<Object?> get props => [fajr, isha];
}
