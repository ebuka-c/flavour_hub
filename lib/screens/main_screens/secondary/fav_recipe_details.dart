import 'package:flavor_hub/constants/app_data.dart';
import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FavRecipeDetails extends StatefulWidget {
  FavRecipeDetails(
      {super.key,
      this.recipeName,
      this.recipeFav,
      this.recipeImg,
      this.recipeIngred,
      this.recipeDur,
      this.recipeId});

  final String? recipeName, recipeImg;
  bool? recipeFav;
  final int? recipeDur;
  final recipeIngred;
  final recipeId;

  @override
  State<FavRecipeDetails> createState() => _FavRecipeDetailsState();
}

class _FavRecipeDetailsState extends State<FavRecipeDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        elevation: 0,
        actions: [
          Icon(
            (widget.recipeFav ?? false)
                ? Icons.favorite
                : Icons.favorite_outline,
            color: (widget.recipeFav ?? false) ? Colors.amberAccent : null,
            size: 30,
          ),
          SizedBox(width: 15.0.w)
        ],
      ),
      body: Stack(
        children: [
          // Top Half: Food Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.recipeImg ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.45,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 15),
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    // Recipe Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            widget.recipeName ?? 'Untitled',
                            style: titleSmall.copyWith(
                              fontFamily: 'Bold',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Iconsax.clock,
                          color: AppColors.lightText2,
                          size: 20,
                        ),
                        SizedBox(width: 8.0.w),
                        Text(
                          '${widget.recipeDur} min',
                          style:
                              bodySmall.copyWith(color: AppColors.lightText2),
                        )
                      ],
                    ),

                    SizedBox(height: 10),
                    // Recipe Description
                    Text(
                      'A step-by-step guide to make delicious ${widget.recipeName} at home.',
                      style: bodyMedium.copyWith(
                        fontSize: 16,
                        color: AppColors.lightText,
                      ),
                    ),
                    SizedBox(height: 20),
                    DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          // TabBar Container
                          Container(
                            height: 50.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.appBackground,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TabBar(
                                controller: _tabController, // Use TabController
                                labelColor: AppColors.white,
                                unselectedLabelColor: AppColors.black,
                                dividerColor: AppColors.transparent,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelStyle: bodyMedium.copyWith(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500),
                                tabs: const [
                                  Tab(text: 'Ingredients'),
                                  Tab(text: 'Instruction'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            constraints: BoxConstraints(maxHeight: 400),
                            child: TabBarView(
                              controller: _tabController, // Use TabController
                              physics: const BouncingScrollPhysics(),
                              children: [
                                // Ingredients Tab
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ingredients:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemBuilder: (_, index) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Opacity(
                                                opacity: 0.7,
                                                child: Icon(Icons.check_circle,
                                                    color: AppColors.appPrimary,
                                                    size: 18),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                ' - ${widget.recipeIngred?[index] ?? ''}',
                                              )
                                            ],
                                          );
                                        },
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 1),
                                        itemCount:
                                            widget.recipeIngred?.length ?? 0),
                                  ],
                                ),
                                // Instruction Tab
                                ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.7,
                                            child: Icon(Icons.check_circle,
                                                color: AppColors.appPrimary,
                                                size: 18),
                                          ),
                                          SizedBox(width: 15),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              child: Text(instructions[index]))
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 8),
                                    itemCount: instructions.length),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
          // Show AppButton only on Instruction tab
          if (_tabController.index == 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                onTap: () {},
                width: 150.0.w,
                height: 40.0.h,
                radius: 10,
                btnChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.play, size: 20),
                    SizedBox(width: 5),
                    Text('Play Video', style: bodyMedium.copyWith(fontSize: 12))
                  ],
                ),
                margin: EdgeInsets.only(bottom: 30.0.h),
              ),
            ),
        ],
      ),
    );
  }
}
