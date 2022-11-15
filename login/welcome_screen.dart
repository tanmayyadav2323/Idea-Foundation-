import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/login/widgets/standard_elevated_button.dart';
import 'package:sizer/sizer.dart';

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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/boarding_image.jpg"),
              fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter)),
      child: Container(
        color: Colors.white.withOpacity(0.3),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 35.h),
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
              SizedBox(height: 35.h),
              StandardElevatedButton(
                isArrowButton: true,
                labelText: "Continue",
                onTap: () {
                  widget.controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
