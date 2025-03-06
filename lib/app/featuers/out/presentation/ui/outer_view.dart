import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

class OuterView extends StatelessWidget {
  const OuterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prayer Times Widget')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            updatePrayerTimes();
          },
          child: Text('Update Widget'),
        ),
      ),
    );
  }
}

void updatePrayerTimes() {
  HomeWidget.saveWidgetData<String>('date', '20 April 2025');
  HomeWidget.saveWidgetData<String>('fajr', '4:49 AM');
  HomeWidget.saveWidgetData<String>('Isha', '7:20 AM');
  HomeWidget.saveWidgetData<String>('dhuhr', '12:30 PM');
  HomeWidget.saveWidgetData<String>('asr', '3:45 PM');
  HomeWidget.saveWidgetData<String>('maghrib', '6:10 PM');

  HomeWidget.updateWidget(name: 'MyHomeWidgetProvider');
}
