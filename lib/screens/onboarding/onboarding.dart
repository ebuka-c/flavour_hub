import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/images.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_clipper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController1 = PageController();

  final PageController _pageController2 = PageController();

  int _pageIndex = 0;

  bool isLastPage = false;

  onChangeIndex(int index) {
    _pageIndex = index;
    setState(() {
      if (index == 2) {
        isLastPage = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0.h),
                SizedBox(
                  height: 170,
                  child: PageView(
                    controller: _pageController1,
                    physics: NeverScrollableScrollPhysics(), // Disable swiping
                    onPageChanged: (index) {
                      onChangeIndex(index);
                    },
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              'Get all the recipes that you need',
                              textAlign: TextAlign.center,
                              style: titleMedium.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            'Whether you are gaining or losing, we have all the recipes that you need',
                            textAlign: TextAlign.center,
                            style: bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightText),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              'Uncover a world of recipes for every occasion',
                              textAlign: TextAlign.center,
                              style: titleMedium.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            'We are updating our food databases every minute to help you',
                            textAlign: TextAlign.center,
                            style: bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightText),
                          ),
                        ],
                      ),
                      //
                      Column(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              'Every recipe you need just a tap away',
                              textAlign: TextAlign.center,
                              style: titleMedium.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            'We are updating our food databases every minute to help you',
                            textAlign: TextAlign.center,
                            style: bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0.h),
                isLastPage
                    ? AppButton(
                        onTap: () {
                          Get.offNamed(AppRoutes.signUpScreen);
                        },
                        text: 'Get Started',
                        radius: 30,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Skip',
                            style: bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightText2),
                          ),
                          AppButton(
                            onTap: () {
                              // Navigate to the next page
                              if (_pageIndex < 2) {
                                _pageIndex++;
                                _pageController1.animateToPage(_pageIndex,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                                _pageController2.animateToPage(_pageIndex,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                                setState(() {});
                              }
                            },
                            width: 100,
                            radius: 30,
                            height: 50,
                            text: 'Next',
                          )
                        ],
                      ),
                SizedBox(height: 50.0.h)
              ],
            ),
          ),
          ClipPath(
            clipper: RPSCustomClipper(),
            child: SizedBox(
              width: w,
              height: h / 1.82,
              child: PageView(
                controller: _pageController2,
                physics: NeverScrollableScrollPhysics(), // Disable swiping
                onPageChanged: (index) {
                  onChangeIndex(index);
                },
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.ob1),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.ob2),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.ob3),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
