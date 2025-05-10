import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/azkar/models/azkar_names_model.dart';
import 'package:muslim/app/featuers/azkar/ui/azkar_name_button.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key});

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  List<AzkarNamesModel> namesList = [];

  @override
  void initState() {
    super.initState();
    loadNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: const Center(child: CustomText(text: "الأذكار", fontSize: 32)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: namesList.length,
        itemBuilder: (context, index) {
          return AzkarNameButton(model: namesList[index]);
        },
      ),
    );
  }

  loadNames() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/azkar_names.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarNamesModel _section = AzkarNamesModel.fromJson(section);
        namesList.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      log(error);
    });
  }
}
