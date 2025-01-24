import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/images.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchCntrl = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    List<String> categ = [
      'Breakfast',
      'Dinner',
      'Dessert',
      'Noodles',
      'Fruits',
      'Pasta'
    ];
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Got a tasty dish in mind?',
                textAlign: TextAlign.center,
                style: titleMedium.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SearchTextField(
                      controller: _search, hintText: 'Search any recipe'),
                ),
                SizedBox(width: 10),
                Container(
                  width: 47.0.w,
                  height: 47.0.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.appPrimary),
                  child: Icon(Icons.sort, color: AppColors.white),
                )
              ],
            ),
            SizedBox(height: 25.0.h),
            Text('Categories',
                style: titleSmall.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: 5.0.h),
            SizedBox(
              height: 100.0.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70.0.w,
                          height: 70.0.h,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Text(
                          '  ${categ[index]}',
                          style:
                              bodySmall.copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                        width: 15.0.w,
                      ),
                  itemCount: categ.length),
            ),
            SizedBox(height: 25.0.h),
          ],
        ),
      ),
    );
  }
}
