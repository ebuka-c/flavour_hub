import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../constants/images.dart';
import '../../page_routes/route_name.dart';
import '../../widgets/nationality.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 1,
          title: Text('Saved to Favourites')),
      body: ListView.builder(
          itemBuilder: (_, __) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.recipeScreen);
              },
              child: Container(
                width: double.infinity,
                height: 120.0.h,
                margin: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10),
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
          itemCount: 2),
    );
  }
}
