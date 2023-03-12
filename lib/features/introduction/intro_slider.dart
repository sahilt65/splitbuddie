import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';

class IntroductionPage extends StatefulWidget {
  static const String routeName = "introduction-slider";
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  IntroductionPageState createState() => IntroductionPageState();
}

class IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => const HomePage()),
    // );

    Navigator.pushNamed(context, AuthScreen.routeName);
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/logo.png',
      height: 150,
      width: 150,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(
          54,
          99,
          110,
          1,
        ),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      // globalHeader: Align(
      //   alignment: Alignment.center,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       // child: _buildFullscreenImage(),
      //     ),
      //   ),
      // ),

      // globalFooter: Container(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Welcome to SplitBuddie",
          body: "SplitBuddie keeps track of balances bewtween buddiess",
          image: _buildFullscreenImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Add Expense",
          body: "You can split expenses with groups or with individuals",
          image: _buildFullscreenImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Settle Up",
          body: "Pay your friends back any time",
          image: _buildFullscreenImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Let's get Started",
            // body: "Tap anywhere",
            image: _buildFullscreenImage(),
            decoration: pageDecoration,
            // footer: Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Container(
            //     alignment: Alignment.bottomCenter,
            //     color: Colors.white,
            //     height: 60,
            //   ),
            // ),
            bodyWidget: GestureDetector(
              onTap: () {
                _onIntroEnd(context);
              },
              child: const Text(
                "Tap here to begin",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: AppColors.mainAppFaintColor,
      ),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        Icons.arrow_forward,
        color: AppColors.mainAppFaintColor,
      ),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(bottom: 90, right: 10, left: 10),
      controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
