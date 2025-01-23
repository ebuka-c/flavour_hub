import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/images.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_clipper.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    int pageIndex = 0;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: DotIndicator(
                                isActive: index == pageIndex,
                              ),
                            )),
                  ],
                ),
                SizedBox(height: 40.0.h),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Get all the recipes that you need',
                    textAlign: TextAlign.center,
                    style: titleMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Text(
                  'Whether you are gaining or losing, we have all the recipes that you need',
                  textAlign: TextAlign.center,
                  style: bodyLarge.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.lightText),
                ),
                SizedBox(
                  height: 70.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skip',
                      style: bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightText2),
                    ),
                    AppButton(
                      onTap: () {},
                      width: 100,
                      radius: 30,
                      height: 50,
                      text: 'Next',
                    )
                  ],
                ),
                SizedBox(
                  height: 80.0.h,
                )
              ],
            ),
          ),
          ClipPath(
            clipper: RPSCustomClipper(),
            child: Container(
              width: w,
              height: h / 1.87,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.ob1), fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * -0.0243333, size.height * -0.0091706);
    path.lineTo(size.width * 1.0025641, 0);
    path.quadraticBezierTo(
      size.width * 1.0747949,
      size.height * 0.5345261,
      size.width * 1.4076154,
      size.height * 0.6585545,
    );
    path.cubicTo(
      size.width * 0.6642564,
      size.height * 0.5719668,
      size.width * 0.5820513,
      size.height * 1.2325355,
      size.width * -0.0681795,
      size.height * 0.7562559,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: isActive ? 12 : 10,
        width: isActive ? 30 : 10,
        decoration: BoxDecoration(
            color: isActive
                ? AppColors.appPrimary
                : AppColors.appPrimary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12)));
  }
}
