import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final int? number;
  final String? en;
  final String? ar;
  final int? days;

  const Month({this.number, this.en, this.ar, this.days});

  factory Month.fromCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
      Map<String, dynamic> json) {
    return Month(
      number: json['number'] as int?,
      en: json['en'] as String?,
      ar: json['ar'] as String?,
      days: json['days'] as int?,
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'number': number,
      'en': en,
      'ar': ar,
      'days': days,
    };
  }

  @override
  List<Object?> get props => [number, en, ar, days];
}
