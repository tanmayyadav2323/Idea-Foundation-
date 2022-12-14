import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'widgets/standard_elevated_button.dart';

class WelcomeScreen extends StatefulWidget {
  final PageController controller;

  const WelcomeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.topCenter,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      "assets/images/boarding_image.jpg",
                    ),
                    alignment: Alignment.topCenter),
              ),
              child: Container(
                color: Colors.white.withOpacity(0.3),
                child: Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        "Welcome To",
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Idea Foundation",
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      StandardElevatedButton(
                        isArrowButton: true,
                        onTap: () {
                          widget.controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        labelText: "Continue",
                      ),
                      SizedBox(
                        height: 8.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
