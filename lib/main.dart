import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/blocs/auth/auth_bloc.dart';
import 'package:preco/repositories/auth/auth_repository.dart';
import 'package:preco/repositories/storage/storage_repository.dart';
import 'package:preco/repositories/user/user_repository.dart';
import 'package:sizer/sizer.dart';

import 'blocs/simple_bloc_observer.dart';
import 'config/custom_router.dart';
import 'login/login_cubit/login_cubit.dart';
import 'ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  EquatableConfig.stringify = kDebugMode;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(),
        ),
        RepositoryProvider<StorageRepository>(
          create: (_) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>()),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            title: 'Idea Foundation',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Colors.lightGreen[50]),
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.black)),
            ),
            onGenerateRoute: CustomRouter.onGenerateRoute,
            initialRoute: SplashScreen.routename,
          ),
        ),
      ),
    );
  }
}
