import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/images.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchCntrl = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi ${user?.displayName ?? ''}!',
              style: bodyMedium,
            ),
            SizedBox(width: 5.0.w),
            Image.asset(
              AppImages.wavinghand,
              width: 20.0.w,
              height: 20.0.h,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text('Got a tasty dish in mind?',
                  textAlign: TextAlign.center,
                  style: titleMedium.copyWith(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchTextField(
                        onTap: () {
                          Get.toNamed(AppRoutes.searchScreen);
                        },
                        readOnly: true,
                        controller: _search,
                        hintText: 'Search any recipe'),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.searchScreen),
                    child: Container(
                      width: 47.0.w,
                      height: 47.0.h,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.appPrimary),
                      child: Icon(Icons.sort, color: AppColors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25.0.h),
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text('Categories',
                  style: titleSmall.copyWith(fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 5.0.h),
            SizedBox(
              height: 100.0.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70.0.w,
                          height: 70.0.h,
                          margin: EdgeInsets.only(
                              right: index == categ.length - 1 ? 15.0.w : 0.0,
                              left: index == 0 ? 15.0.w : 0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              categImages[index],
                              width: 40.0.w,
                              height: 40.0.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding:
                              EdgeInsets.only(left: index == 0 ? 15.0.w : 0),
                          child: Text(
                            '  ${categ[index]}',
                            style:
                                bodySmall.copyWith(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                        width: 15.0.w,
                      ),
                  itemCount: categ.length),
            ),
            SizedBox(height: 20.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Recommended for you',
                      style: titleSmall.copyWith(fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See more ',
                      style: bodySmall.copyWith(
                          color: AppColors.appPrimary,
                          fontWeight: FontWeight.w800,
                          decorationColor: AppColors.appPrimary),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0.h),
            //
            SizedBox(
              height: 200.0.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120.0.w,
                          height: 150.0.h,
                          margin: EdgeInsets.only(
                              right: index == imgRecommended.length - 1
                                  ? 15.0.w
                                  : 0.0,
                              left: index == 0 ? 15.0.w : 0),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            image: DecorationImage(
                                image: AssetImage(imgRecommended[index]),
                                opacity: 0.8,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding:
                              EdgeInsets.only(left: index == 0 ? 15.0.w : 0),
                          child: Text(
                            ' ${nameRecommended[index]}',
                            style:
                                bodySmall.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding:
                              EdgeInsets.only(left: index == 0 ? 17.0.w : 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Icon(Icons.timer,
                                    size: 13, color: AppColors.black),
                                SizedBox(width: 5.0.w),
                                Text(
                                  '${timeTaken[index]} min',
                                  style: bodySmall,
                                )
                              ]),
                              SizedBox(width: 45.0.w),
                              Icon(Icons.favorite_outline, size: 13),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                        width: 15.0.w,
                      ),
                  itemCount: imgRecommended.length),
            ),
            //
            SizedBox(height: 20.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Recipes of the week',
                      style: titleSmall.copyWith(fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See more ',
                      style: bodySmall.copyWith(
                          color: AppColors.appPrimary,
                          fontWeight: FontWeight.w800,
                          decorationColor: AppColors.appPrimary),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0.h),
            SizedBox(
              height: 170.0.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.0.w,
                          height: 120.0.h,
                          margin: EdgeInsets.only(
                              right:
                                  index == topRImages.length - 1 ? 15.0.w : 0.0,
                              left: index == 0 ? 15.0.w : 0),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            image: DecorationImage(
                                image: NetworkImage(topRImages[index]),
                                opacity: 0.8,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding:
                              EdgeInsets.only(left: index == 0 ? 15.0.w : 0),
                          child: Text(
                            ' ${topRecipes[index]}',
                            style:
                                bodySmall.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Padding(
                          padding:
                              EdgeInsets.only(left: index == 0 ? 17.0.w : 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Icon(Icons.timer,
                                    size: 10, color: AppColors.black),
                                SizedBox(width: 5.0.w),
                                Text(
                                  '${timeTaken[index]} min',
                                  style: bodySmall,
                                )
                              ]),
                              SizedBox(width: 70.0.w),
                              Icon(Icons.favorite_outline, size: 13),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                        width: 15.0.w,
                      ),
                  itemCount: topRecipes.length),
            ),
          ],
        ),
      ),
    );
  }
}
