import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:preco/config/session_helper.dart';
import 'package:preco/ui/privacy_policy.dart';
import 'package:preco/ui/terms_and_conditions.dart';
import 'package:sizer/sizer.dart';

import 'login_cubit/login_cubit.dart';
import 'widgets/phoneform_widget.dart';
import 'widgets/standard_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  final PageController controller;
  const LoginScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isButtonNotActive = true;

  @override
  void initState() {
    _textEditingController.text =
        SessionHelper.phone?.replaceAll("+91", "") ?? "";
    _textEditingController.addListener(() {
      final isButtonNotActive = _textEditingController.text.length != 10;
      setState(() {
        this.isButtonNotActive = isButtonNotActive;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.1,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/boarding_image.jpg"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter)),
            child: Container(
              color: Colors.white.withOpacity(0.3),
              child: Column(
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                        onPressed: () {
                          widget.controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    height: 24.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        child: _animatedQuotedTextsMethod(),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PhoneForm(
                        textEditingController: _textEditingController),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _termsAndPrivacyPolicy(),
                  ),
                  SizedBox(height: 1.5.h),
                  StandardElevatedButton(
                    isArrowButton: true,
                    labelText: "Continue",
                    onTap: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if (connectivityResult != ConnectivityResult.none) {
                        widget.controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                        BlocProvider.of<LoginCubit>(context).sendOtpOnPhone(
                            phone: context.read<LoginCubit>().phone);
                        SessionHelper.phone = context.read<LoginCubit>().phone;
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                'The Internet connection appears to be offline',
                            backgroundColor: Colors.redAccent);
                      }
                    },
                    isButtonNull: isButtonNotActive,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _termsAndPrivacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "By continuing you agree to our  ",
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
          ),
          TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                }),
          TextSpan(
            text: " and ",
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
          ),
          TextSpan(
              text: "Terms and Conditions",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsAndConditions()),
                  );
                }),
        ],
      ),
    );
  }

  AnimatedTextKit _animatedQuotedTextsMethod() {
    return AnimatedTextKit(
      pause: const Duration(seconds: 2),
      repeatForever: true,
      animatedTexts: [
        RotateAnimatedText(
          'Happiness doesn’t result from what we get, but from what we give. ― Ben Carson',
          duration: const Duration(seconds: 5),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
        RotateAnimatedText(
          'Remember that the happiest people are not those getting more, but those giving more. ―H. Jackson Brown Jr.',
          duration: const Duration(seconds: 5),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
        RotateAnimatedText(
          'Those who are happiest are those who do the most for others. — Booker T. Washington',
          duration: const Duration(seconds: 5),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.2),
        ),
        RotateAnimatedText(
          'Money might not be able to buy happiness, but giving it away can.',
          duration: const Duration(seconds: 5),
          textAlign: TextAlign.center,
          textStyle: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
