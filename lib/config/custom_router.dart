import 'package:flutter/material.dart';
import 'package:preco/login/pageview.dart';
import 'package:preco/ui/authentication_screen.dart';
import 'package:preco/ui/nav_screen.dart';

import '../login/onboarding/onboarding_pageview.dart';
import '../ui/splash_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routename:
        return SplashScreen.route();
      case AuthenticationScreen.routename:
        return AuthenticationScreen.route();
      case Onboardingpageview.routeName:
        return Onboardingpageview.route();
      case LoginPageView.routeName:
        return LoginPageView.route();
      case NavScreen.routename:
        return NavScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
