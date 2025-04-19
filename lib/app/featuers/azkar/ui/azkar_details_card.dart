import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/core/utils/app_images.dart';
import 'package:muslim/app/featuers/azkar/models/azkar_details_model.dart';
import 'package:muslim/app/shared/custom_image.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarDetailsCard extends StatefulWidget {
  const AzkarDetailsCard({super.key, required this.id, required this.title});
  final int id;
  final String title;

  @override
  State<AzkarDetailsCard> createState() => _AzkarDetailsCardState();
}

class _AzkarDetailsCardState extends State<AzkarDetailsCard> {
  List<AzkarDetailsModel> detailsList = [];

  @override
  void initState() {
    super.initState();
    loadDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: -5,
            right: -5,
            bottom: -10,
            child: CustomImageAsset(
              height: 120,
              width: 400,
              imagePath: AppImages.bottomImage,
            ),
          ),
          const Positioned(
            child: CustomImageAsset(
              imagePath: AppImages.centerImage,
            ),
          ),
          const Positioned(
            right: 8,
            top: 12,
            child: CustomImageAsset(
              height: 50,
              width: 60,
              imagePath: AppImages.rightCornerImage,
            ),
          ),
          const Positioned(
            left: 8,
            top: 12,
            child: CustomImageAsset(
              height: 50,
              width: 60,
              imagePath: AppImages.leftCornerImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Expanded(
                  child: ListView.builder(
                    itemCount: detailsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomText(
                            text: detailsList[index].content!,
                            fontSize: 20,
                            textAlign: TextAlign.center,
                            maxLines: 1000,
                          ),
                          Align(
                            heightFactor: 1.5,
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                                text: '[ ${detailsList[index].reference!} ]',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 60),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }

  loadDetails() async {
    detailsList = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/azkar_details.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarDetailsModel sectionDetail = AzkarDetailsModel.fromJson(section);
        if (sectionDetail.sectionId == widget.id) {
          detailsList.add(sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      log(error);
    });
  }
}
