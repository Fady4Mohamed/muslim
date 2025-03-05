import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

class OuterView extends StatelessWidget {
  const OuterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('muslim app')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  HomeWidget.saveWidgetData<String>(
                      'widget_text', 'صلي على محمد');
                  // Provide the fully qualified name of your widget provider
                  HomeWidget.updateWidget(name: 'MyHomeWidgetProvider');
                },
                child: Text('صلي على محمد'),
              ),
                 ElevatedButton(
                onPressed: () {
                  HomeWidget.saveWidgetData<String>(
                      'widget_text', 'استغفر الله');
                  // Provide the fully qualified name of your widget provider
                  HomeWidget.updateWidget(name: 'MyHomeWidgetProvider');
                },
                child: Text('استغفر الله'),
              ),
                 ElevatedButton(
                onPressed: () {
                  HomeWidget.saveWidgetData<String>(
                      'widget_text',  'لا اله الا الله');
                  // Provide the fully qualified name of your widget provider
                  HomeWidget.updateWidget(name: 'MyHomeWidgetProvider');
                },
                child: Text( 'لا اله الا الله'),
              ),
            ],
          ),
        ),
      );
  }
}