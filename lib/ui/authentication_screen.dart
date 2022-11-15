import 'package:flutter/material.dart';

import 'splash_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String routename = '/authenticationScreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (_) => AuthenticationScreen(),
    );
  }

  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
