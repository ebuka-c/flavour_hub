import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/constants/locals.dart';
import 'package:flavor_hub/controllers/auth_controller.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/button_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/images.dart';
import '../../widgets/dialogs/logout_dialog.dart';

final _authC = Get.find<AuthController>();

class Profile extends StatelessWidget {
  Profile({super.key, this.color});
  final Color? color;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 1,
          title: Text('Profile')),
      backgroundColor: AppColors.appBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25.0.h,
                foregroundImage: NetworkImage(AppImages.profileHeader),
                backgroundImage: AssetImage(AppImages.avatar),
                backgroundColor: AppColors.textfieldBorder,
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Name: ',
                  style: bodyMedium,
                  children: [
                    TextSpan(
                      text: user?.displayName ?? '',
                      style: titleSmall.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Expertise: ',
                  style: bodyMedium,
                  children: [
                    TextSpan(
                      text: getStorageInstance.read(COOKING_LEVEL) ?? '',
                      style: titleSmall.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.uploadRecipe);
                },
                child: Container(
                  width: double.infinity,
                  height: 65.0.h,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.lightText2)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Upload Your Recipe', style: bodyLarge),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.lightText2,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () async {
                  //
                  final logOut = await logOutDialog(context: context);
                  if (logOut ?? false) {
                    await _authC.logout();
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 65.0.h,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.lightText2)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            if (_authC.isLoading.value) {
                              return const AppLoadingIndicator();
                            }
                            return Text('Logout', style: bodyLarge);
                          }),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.lightText2,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
