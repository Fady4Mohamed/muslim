import 'package:flutter/material.dart';
import 'package:muslim/app/featuers/out/presentation/ui/outer_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:OuterView(),
    );
  }
}
