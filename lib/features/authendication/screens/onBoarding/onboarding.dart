import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authendication/screens/onBoarding/widget/onboarding_dot_navigation.dart';
import 'package:t_store/features/authendication/screens/onBoarding/widget/onboarding_next_button.dart';
import 'package:t_store/features/authendication/screens/onBoarding/widget/onboarding_pages.dart';
import 'package:t_store/features/authendication/screens/onBoarding/widget/onboarding_skip.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizondal Scrollable page
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),

          /// skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPage Indicator
          const OnBoasrdingDotNavigation(),

          /// Next Rounded Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

