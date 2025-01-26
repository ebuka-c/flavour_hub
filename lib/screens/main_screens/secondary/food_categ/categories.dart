import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../constants/app_data.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/custom_textstyles.dart';
import '../../../../widgets/nationality.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.title});
  final String title;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> animations;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animations = List.generate(
      recipesTile.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1), // Start off-screen
        end: const Offset(0, 0), // End at its final position
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Stagger animation start
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    // Start the animation
    _controller.forward();
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: false, elevation: 1, title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final recipe = recipesTile[index];

            return SlideTransition(
              position: animations[index],
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 120.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.0.w),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: AppColors.black.withOpacity(0.1),
                    ),
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
                            image: NetworkImage(recipesTile[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0.w),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Nationality(
                                  nationality: recipesTile[index]
                                      ['nationality'],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(Icons.share_rounded, size: 15),
                                ),
                                SizedBox(width: 8.0.w),
                                InkWell(
                                  onTap: () {
                                    recipe['favourite'] = !recipe['favourite'];
                                    setState(() {});
                                  },
                                  child: Icon(
                                      recipe['favourite']
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: recipe['favourite']
                                          ? AppColors.appRed
                                          : null,
                                      size: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0.h),
                            SizedBox(
                              width: 170,
                              child: Text(
                                recipesTile[index]['name'],
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
                                  '${recipesTile[index]['duration']} min',
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
              ),
            );
          },
          separatorBuilder: (_, __) => SizedBox(height: 10.0.h),
          itemCount: 4,
        ),
      ),
    );
  }
}
