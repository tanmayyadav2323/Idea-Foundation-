import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_button/timer_button.dart';

import 'login_cubit/login_cubit.dart';

class OtpScreen extends StatefulWidget {
  final PageController pageController;

  const OtpScreen({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isButtonNotActive = true;
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  _initSmsRetriever() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void initState() {
    _focusNode.requestFocus();
    _initSmsRetriever();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          Fluttertoast.showToast(msg: state.failure.message);
          _otpController.clear();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/boarding_image.jpg"),
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.topCenter)),
              child: Container(
                color: Colors.white.withOpacity(0.3),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            leading: IconButton(
                                onPressed: () {
                                  widget.pageController.previousPage(
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: PinFieldAutoFill(
                              controller: _otpController,
                              focusNode: _focusNode,
                              decoration: UnderlineDecoration(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                                colorBuilder: FixedColorBuilder(
                                    Colors.white.withOpacity(0.6)),
                                lineStrokeCap: StrokeCap.round,
                              ),
                              currentCode: _otpController.text,
                              onCodeSubmitted: (code) {},
                              onCodeChanged: (code) {
                                if (code!.length == 6) {
                                  _otpController.text = code;
                                  BlocProvider.of<LoginCubit>(context)
                                      .verifyOtp(otp: _otpController.text);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 4.h),
                          _didntReceiveCodeMethod(),
                          SizedBox(height: 2.h),
                        ],
                      ),
                      state.status == LoginStatus.otpVerifying ||
                              state.status == LoginStatus.success
                          ? Center(
                              child: (Platform.isIOS)
                                  ? const CupertinoActivityIndicator()
                                  : const CircularProgressIndicator(),
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _didntReceiveCodeMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't get the code? ",
          style: TextStyle(fontSize: 10.sp, color: Colors.white),
        ),
        TimerButton(
          label: 'Resend',
          onPressed: () {
            BlocProvider.of<LoginCubit>(context)
                .sendOtpOnPhone(phone: context.read<LoginCubit>().phone);
          },
          timeOutInSeconds: 30,
          disabledColor: Colors.white,
          buttonType: ButtonType.FlatButton,
          activeTextStyle: TextStyle(fontSize: 10.sp, color: Colors.white),
        ),
      ],
    );
  }
}
