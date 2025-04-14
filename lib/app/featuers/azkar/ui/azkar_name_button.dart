import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/app/core/routing/app_router.dart';
import 'package:muslim/app/core/utils/app_color.dart';
<<<<<<< HEAD:lib/app/featuers/azkar/presentation/ui/azkar_button.dart
=======
import 'package:muslim/app/featuers/azkar/models/azkar_names_model.dart';
import 'package:muslim/app/featuers/azkar/ui/azkar_page.dart';
>>>>>>> origin/kareem:lib/app/featuers/azkar/ui/azkar_name_button.dart
import 'package:muslim/app/shared/custom_text.dart';

class AzkarNameButton extends StatelessWidget {
  const AzkarNameButton({super.key, required this.model});
  final AzkarNamesModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
<<<<<<< HEAD:lib/app/featuers/azkar/presentation/ui/azkar_button.dart
        
        GoRouter.of(context).push(AppRouter.azkarPage);
=======
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AzkarPage(title: model.name!, id: model.id!);
          },
        ));
>>>>>>> origin/kareem:lib/app/featuers/azkar/ui/azkar_name_button.dart
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.mainColorLight,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColor.secondaryColor, // Outline color
              width: 1, // Outline thickness
            ),
          ),
          child: Center(
            child: CustomText(text: model.name!, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
