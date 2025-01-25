import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/images.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/search_textfield.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close, size: 17, weight: 100)),
        centerTitle: false,
        title: Text('Search Recipes',
            style: titleSmall.copyWith(fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 55.0.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0.w, 0, 15.0.w, 5.0.h),
              child: SearchTextField(
                controller: searchCntrl,
                inputBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search',
                autoFocus: true,
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (__, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.recipeScreen);
                },
                child: Container(
                  width: double.infinity,
                  height: 120.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.0.w),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: AppColors.black.withOpacity(0.1))
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0.w,
                        height: 80.0.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(AppImages.pizza),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10.0.w),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Nationality(
                                  nationality: 'Chinese',
                                ),
                                const Spacer(),
                                GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.share_rounded, size: 15)),
                                SizedBox(width: 8.0.w),
                                Icon(Icons.favorite_outline, size: 16)
                              ],
                            ),
                            SizedBox(height: 10.0.h),
                            SizedBox(
                              width: 170,
                              child: Text(
                                'Fried crispy chicken with sausage.',
                                style: bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(Icons.timer,
                                    size: 13, color: AppColors.lightText2),
                                SizedBox(width: 5.0.w),
                                Text(
                                  '30 min',
                                  style: bodySmall.copyWith(
                                      color: AppColors.lightText2),
                                ),
                                const Spacer(),
                                Icon(Iconsax.note_text,
                                    size: 13, color: AppColors.lightText2),
                                SizedBox(width: 5.0.w),
                                Text(
                                  '6 recipes',
                                  style: bodySmall.copyWith(
                                      color: AppColors.lightText2),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 10.0.h),
            itemCount: 7),
      ),
    );
  }
}

class Nationality extends StatelessWidget {
  const Nationality({super.key, required this.nationality});
  final String nationality;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.0.w,
          height: 20,
          decoration: BoxDecoration(
              color: AppColors.appPrimary,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(width: 3.0.h),
        Text(
          nationality,
          style: bodySmall.copyWith(color: AppColors.appPrimary),
        )
      ],
    );
  }
}
