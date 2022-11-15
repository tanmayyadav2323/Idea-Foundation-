import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/login/onboarding/onboarding_pageview.dart';
import 'package:preco/login/pageview.dart';

import '../blocs/auth/auth_bloc.dart';
import 'nav_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routename = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (prevState, state) => prevState.status != state.status,
          listener: (context, state) {
            if (state.status == AuthStatus.unauthenticated) {
              //Go to welcome screen
              Navigator.of(context).pushNamed(LoginPageView.routeName);
            } else if (state.status == AuthStatus.authenticated &&
                state.isUserExist == true) {
              //Go to navigation screen
              Navigator.of(context).pushNamed(
                NavScreen.routename,
              );
            } else if (state.status == AuthStatus.authenticated &&
                state.isUserExist == false) {
              // BlocProvider.of<InitializeStreamChatCubit>(context)
              //     .initializeStreamChat(context);
              Navigator.of(context).pushNamed(Onboardingpageview.routeName);
            }
          },
          child: const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
