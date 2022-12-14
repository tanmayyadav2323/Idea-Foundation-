import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'otp_screen.dart';
import 'welcome_screen.dart';

class LoginPageView extends StatefulWidget {
  static const routeName = '/loginPageView';
  LoginPageView({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (context, _, __) => LoginPageView());
  }

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  int _page = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageView(

            physics: NeverScrollableScrollPhysics(),

            children: _buildPages(),
            controller: _pageController,
            onPageChanged: _onPageViewChange,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      WelcomeScreen(
        controller: _pageController,
        
      ),
      LoginScreen(
        controller: _pageController,
      ),
      OtpScreen(
        pageController: _pageController,
      ),
    ];
  }

  _onPageViewChange(int value) {
    setState(() {
      _page = value;
    });
  }
}
