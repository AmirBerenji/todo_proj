import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/common/widgets/width_spacer.dart';
import 'package:todo_proj/features/onboarding/widgets/page_one.dart';
import 'package:todo_proj/features/onboarding/widgets/page_two.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo()
            ],
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          pageController.nextPage(duration: const Duration(microseconds: 600), 
                          curve: Curves.ease);
                        },
                        child: const Icon(Ionicons.chevron_forward_circle,
                        size: 30,
                        color: AppConst.kLight,),
                      ),
                      const WidthSpacer(width: 5),
                      ResuableText(text: "Skip" , style: appstyle(16, AppConst.kLight, FontWeight.w500))
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration: const Duration(microseconds: 600), 
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(
                      controller: pageController, 
                      count: 2,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 16,
                        spacing: 10,
                        dotColor: AppConst.kYellow
                      ),),
                  )
                ],
              ),
              ),
          ),
        ],
      )
    );
  }
}