
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';

class NextPrayerInfo {
  final PrayEntityModel nextPrayer;
  final String timeRemaining;
  NextPrayerInfo({
    required this.nextPrayer,
    required this.timeRemaining,
  });
}

NextPrayerInfo getNextPrayerInfo(List<PrayEntityModel> prayers) {
  DateTime currentTime = DateTime.now();
  PrayEntityModel? nextPrayer;
  Duration? timeRemaining;
  
  List<Map<String, dynamic>> prayersWithDateTime = prayers.map((prayer) {
    DateTime prayerDateTime = _parseTimeString(prayer.time, currentTime);
    return {
      'model': prayer,
      'dateTime': prayerDateTime,
    };
  }).toList();
  
  prayersWithDateTime.sort((a, b) => a['dateTime'].compareTo(b['dateTime']));
  
  for (var prayer in prayersWithDateTime) {
    if (prayer['dateTime'].isAfter(currentTime)) {
      nextPrayer = prayer['model'];
      timeRemaining = prayer['dateTime'].difference(currentTime);
      break;
    }
  }
  
  if (nextPrayer == null) {
    nextPrayer = prayersWithDateTime.first['model'];
    
    DateTime firstPrayerTime = prayersWithDateTime.first['dateTime'];
    
    DateTime tomorrowPrayerTime = DateTime(
      currentTime.year, 
      currentTime.month, 
      currentTime.day + 1,
      firstPrayerTime.hour, 
      firstPrayerTime.minute
    );
    
    timeRemaining = tomorrowPrayerTime.difference(currentTime);
  }
  
  String formattedTimeRemaining = _formatDuration(timeRemaining!);
  return NextPrayerInfo(
    nextPrayer: nextPrayer!,
    timeRemaining: formattedTimeRemaining,
  );
}

DateTime _parseTimeString(String timeStr, DateTime currentDate) {
  int hour;
  int minute;
  
  if (timeStr.contains('AM') || timeStr.contains('PM')) {
    bool isPM = timeStr.contains('PM');
    timeStr = timeStr.replaceAll('AM', '').replaceAll('PM', '').trim();
    
    List<String> parts = timeStr.split(':');
    hour = int.parse(parts[0]);
    minute = int.parse(parts[1]);
    
    if (isPM && hour < 12) {
      hour += 12;
    } else if (!isPM && hour == 12) {
      hour = 0;
    }
  } else {
    List<String> parts = timeStr.split(':');
    hour = int.parse(parts[0]);
    minute = int.parse(parts[1]);
  }
  return DateTime(
    currentDate.year,
    currentDate.month,
    currentDate.day,
    hour,
    minute,
  );
}

String _formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes % 60;
  int seconds = duration.inSeconds % 60;
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = seconds.toString().padLeft(2, '0');
  return '$hours:$formattedMinutes:$formattedSeconds';
}
