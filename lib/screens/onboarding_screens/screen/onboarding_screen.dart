import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/screens/onboarding_screens/data/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: Text('Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: const Color(0XFF000000)
                    ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnboardingData.list.length,
                  itemBuilder: (context, index) {
                    final item = OnboardingData.list[index];
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              item.imagePath,
                              width: 250.w,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: const Color(0XFF000000),
                                fontSize: 30.sp,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              item.subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0XFFA8A8A9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.w),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: OnboardingData.list.length,
                    effect: WormEffect(dotHeight: 10.h, dotWidth: 10.h),
                  ),
                  Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0XFFF83758),
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
