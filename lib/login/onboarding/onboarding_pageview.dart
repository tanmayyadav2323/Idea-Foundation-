import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registration_screen.dart';

class Onboardingpageview extends StatefulWidget {
  static const routeName = '/Onboardingpageview';
  Onboardingpageview({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (context, _, __) => Onboardingpageview());
  }

  @override
  State<Onboardingpageview> createState() => _OnboardingpageviewState();
}

class _OnboardingpageviewState extends State<Onboardingpageview> {
  int _page = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: _page != 0 && _page != 4
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined)),
                  actions: _page == 3
                      ? [
                          TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
              
                              ),
                            ),
                          ),
                        ]
                      : null,
                )
              : null,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: _buildPages(),
              controller: _pageController,
              onPageChanged: _onPageViewChange,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      RegistrationScreen(
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
