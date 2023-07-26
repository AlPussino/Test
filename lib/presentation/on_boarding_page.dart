import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test/presentation/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,

      onDone: () {
        // Handle the action when the user taps on the "Done" button
        // For example, you might want to navigate to the main page of your app
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      onSkip: () {
        // Handle the action when the user taps on the "Skip" button
        // For example, you might want to directly navigate to the main page of your app
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      showSkipButton: false, // Set to false if you don't want a skip button
      allowImplicitScrolling: true,
      nextFlex: 0,
      back: const Text("Back"),
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done"),
      showBackButton: true,
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

final List<PageViewModel> pages = [
  PageViewModel(
    title: "Page 1 Title",
    body: "Page 1 Description",
    image: SafeArea(
      child: SvgPicture.asset(
        'assets/svg1.svg',
        width: 160,
        height: 160,
      ),
    ), // Replace with your image path
  ),
  PageViewModel(
    title: "Page 2 Title",
    body: "Page 2 Description",
    image: SafeArea(
      child: SvgPicture.asset(
        'assets/svg2.svg',
        width: 160,
        height: 160,
      ),
    ), // Replace with your image path
  ),
  PageViewModel(
    title: "Page 3 Title",
    body: "Page 3 Description",
    image: SafeArea(
      child: SvgPicture.asset(
        'assets/svg3.svg',
        width: 160,
        height: 160,
      ),
    ), // Replace with your image path
  ),
  // Add more pages as needed
];
