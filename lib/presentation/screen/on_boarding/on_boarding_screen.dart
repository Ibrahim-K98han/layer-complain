import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../routes/route_names.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import 'data/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingData> items = data(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFFCF4F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // PageView for all onboarding pages
            PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Utils.verticalSpace(80.0),
                    // Phone mockup with dynamic image
                    Padding(
                      padding: Utils.symmetric(h: 30.h),
                      child: Center(
                        child: SizedBox(
                          width: size.width * 0.88,
                          height: 350,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // Arched image container
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomImage(
                                  path: item.image,
                                  width: double.infinity,
                                  height: 450,
                                ),
                              ),

                              // Bottom badge
                              Positioned(
                                bottom: -25,
                                right: -20,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      // Green circular background
                                      Container(
                                        width: 40,
                                        height: 40,
                                        padding: EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: greenLightColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CustomImage(
                                          path: KImages.badgeIcon,
                                        ),
                                      ),
                                      const SizedBox(width: 10),

                                      // Texts
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          CustomText(
                                            text: 'Proof of Quality',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CustomText(
                                            text: 'Trust by Verified Outcomes',
                                            fontSize: 12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Skip button
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.loginScreen,
                    (route) => false,
                  );
                },
                child: const CustomText(text: "Skip", fontSize: 16.0),
              ),
            ),
            // Bottom card with dynamic content
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 32,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: Utils.symmetric(h: 35.0),
                      child: CustomText(
                        text: items[_currentPage].title,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        maxLine: 3,
                      ),
                    ),
                    Utils.verticalSpace(20.0),
                    CustomText(
                      text: items[_currentPage].subTitle,
                      fontSize: 16.0,
                      color: lightTextColor,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLine: 3,
                    ),
                    Utils.verticalSpace(48.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Back button: only show if not on the first page
                        if (_currentPage > 0)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                if (_currentPage > 0) {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryColor),
                                ),
                                child: Center(
                                  child: CustomImage(
                                    path: KImages.arrowLeftIcon,
                                    width: 24,
                                    height: 24,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Utils.horizontalSpace(_currentPage > 0 ? 60.0 : 0.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            items.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: index == _currentPage ? 22 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    index == _currentPage
                                        ? primaryColor
                                        : primaryLightColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Utils.horizontalSpace(60.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage == items.length - 1) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RouteNames.loginScreen,
                                  (route) => false,
                                );
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: CustomImage(
                                  path: KImages.arrowRightIcon,
                                  width: 24,
                                  height: 24,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Utils.verticalSpace(20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
