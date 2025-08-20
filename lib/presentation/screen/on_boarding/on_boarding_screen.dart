import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/circle_image.dart';

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
                    Padding(
                      padding: Utils.symmetric(h: 30.h),
                      child: Center(
                        child: SizedBox(
                          width: size.width * 0.88,
                          height: 350,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomImage(
                                  path: item.image,
                                  width: double.infinity,
                                  height: 450,
                                ),
                              ),

                              Positioned(
                                bottom: _currentPage == 2 ? -25 : -10,
                                right: _currentPage == 2 ? 60 : -20,
                                child:
                                    _currentPage == 0
                                        ? ImageSubContainer(
                                          imgColor: greenColor,
                                          bgColor: greenLightColor,
                                          image: KImages.badgeIcon,
                                          title: 'Proof of Quality',
                                          subTitle:
                                              'Trust by Verified Outcomes',
                                        )
                                        : _currentPage == 1
                                        ? Container(
                                          padding: Utils.symmetric(
                                            h: 15.0,
                                            v: 14.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.circular(
                                              50.r,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: '58M+ ',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              CustomText(text: 'Happy Clients'),
                                              Utils.horizontalSpace(8),
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    width: 105,
                                                    height: 30,
                                                  ),
                                                  Positioned(
                                                    child: CustomImage(
                                                      path: KImages.person,
                                                      width: 28.w,
                                                      height: 28.h,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: whiteColor,
                                                          width: 2,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CustomImage(
                                                        path: KImages.person,
                                                        width: 28.w,
                                                        height: 28.h,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 40,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: whiteColor,
                                                          width: 2,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CustomImage(
                                                        path: KImages.person,
                                                        width: 28.w,
                                                        height: 28.h,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 60,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: whiteColor,
                                                          width: 2,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CustomImage(
                                                        path: KImages.person,
                                                        width: 28.w,
                                                        height: 28.h,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 80,
                                                    child: Container(
                                                      padding: Utils.all(value: 4),
                                                      decoration: BoxDecoration(
                                                        color: secondaryColor,
                                                        border: Border.all(
                                                          color: whiteColor,
                                                          width: 2,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CustomImage(
                                                        path: KImages.addCircleIcon,
                                                        width: 16.w,
                                                        height: 16.h,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                        : ImageSubContainer(
                                          imgColor: yellowColor,
                                          bgColor: yellowLightColor,
                                          image: KImages.badgeIcon,
                                          title: 'Safe and secure',
                                          subTitle:
                                              'Privacy First. Security Always.',
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

class ImageSubContainer extends StatelessWidget {
  const ImageSubContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.imgColor,
  });

  final String image;
  final String title;
  final String subTitle;
  final Color bgColor;
  final Color imgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: CustomImage(path: image, color: imgColor),
          ),
          Utils.horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: title, fontWeight: FontWeight.w600),
              CustomText(text: subTitle, fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
