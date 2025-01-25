import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flavor_hub/widgets/auth_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

class UploadRecipe extends StatefulWidget {
  const UploadRecipe({super.key});

  @override
  State<UploadRecipe> createState() => _UploadRecipeState();
}

class _UploadRecipeState extends State<UploadRecipe> {
  final _title = TextEditingController();
  final _ingredients = TextEditingController();

  // storage and firestore
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<File?> pickedImages = [null, null, null];

  Future<void> pickImage(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        pickedImages[index] = File(result.files.single.path!);
      });
    } else {
      if (kDebugMode) print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Add Recipe',
          style: titleMedium,
        ),
        foregroundColor: AppColors.lightText,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Recipe Images',
                style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0.h),
              SizedBox(
                height: 200.0.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageBox(
                      onTap: () {
                        pickImage(0);
                      },
                      width: w / 1.7,
                      height: 200.0.h,
                      selectedImage: pickedImages[0] == null
                          ? null
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                pickedImages[0]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          ImageBox(
                            onTap: () {
                              pickImage(1);
                            },
                            height: 93.0.h,
                            selectedImage: pickedImages[1] == null
                                ? null
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      pickedImages[1]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          const Spacer(),
                          ImageBox(
                            onTap: () {
                              pickImage(2);
                            },
                            height: 93.0.h,
                            selectedImage: pickedImages[2] == null
                                ? null
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      pickedImages[2]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0.h),
              Text(
                'Recipe Short Video',
                style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0.h),
              DottedBorder(
                color: AppColors.appPrimary,
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                dashPattern: const [6, 6, 6, 6],
                strokeWidth: 0.7,
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      color: AppColors.imageBox,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Icon(
                            Icons.play_circle,
                            color: AppColors.appPrimary,
                          ),
                        ),
                        Text(
                          'Mp4 file less than 100MB',
                          style: bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.lightText),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0.h),
              AuthTextField(
                  controller: _title,
                  title: 'Recipe Title',
                  titleStyle: bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  obscureText: false,
                  hasSubtitle: false,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  borderRadius: 16,
                  bottomMargin: 20.0.h),
              AuthTextField(
                  controller: _ingredients,
                  title: 'Ingredients',
                  titleStyle: bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  obscureText: false,
                  hasSubtitle: false,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  maxlines: 4,
                  borderRadius: 16,
                  bottomMargin: 25.0.h),
              AppButton(
                onTap: () {},
                text: 'Upload Recipe',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox(
      {super.key, this.width, this.height, this.onTap, this.selectedImage});

  final double? width, height;
  final Function()? onTap;
  final Widget? selectedImage;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.appPrimary,
      borderType: BorderType.RRect,
      radius: const Radius.circular(15),
      dashPattern: const [6, 6, 6, 6],
      strokeWidth: 0.7,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: AppColors.imageBox,
              borderRadius: BorderRadius.circular(10)),
          child: selectedImage ??
              Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Icon(
                    Icons.add_circle,
                    color: AppColors.appPrimary,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
