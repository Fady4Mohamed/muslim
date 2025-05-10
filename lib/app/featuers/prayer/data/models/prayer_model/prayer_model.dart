import 'package:equatable/equatable.dart';

import 'data.dart';

class PrayerModel extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const PrayerModel({this.code, this.status, this.data});

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data
              .fromCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
                  json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic>
      toCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'code': code,
      'status': status,
      'data': data
          ?.toCode200StatusOkDataTimingsFajr0430Sunrise0609Dhuhr1257Asr1635Sunset1945Maghrib1945Isha2113Imsak0420Midnight0057Firstthird2313Lastthird0241DateReadable09May2025Timestamp1746763200HijriDate11111446FormatDdMmYyyyDay11WeekdayEnAlJumaAArMonthNumber11EnDhAlQaDahArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAdjustedHolidaysMethodHjCoSaGregorianDate09052025FormatDdMmYyyyDay09WeekdayEnFridayMonthNumber5EnMayYear2025DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
    };
  }

  @override
  List<Object?> get props => [code, status, data];
}
