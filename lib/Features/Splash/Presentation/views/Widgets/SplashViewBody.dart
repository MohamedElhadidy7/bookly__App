import 'package:bookly/Constants.dart';
import 'package:bookly/Core/utils/assetsData.dart';
import 'package:bookly/Features/Home/Presentation/Views/HomeView.dart';
import 'package:bookly/Features/Splash/Presentation/views/Widgets/SlidingText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidinganimation;

  @override
  void initState() {
    super.initState();
    initslidingAnimation();
    NavigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assetsdata.logo),
        SlidingText(slidinganimation: _slidinganimation),
      ],
    );
  }

  void initslidingAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _slidinganimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(_animationController);

    _animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(HomeView(),
          transition: Transition.fadeIn, duration: ktransitionduration);
    });
  }
}
