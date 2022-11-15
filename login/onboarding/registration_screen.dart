import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/config/session_helper.dart';
import 'package:preco/model/user_model.dart' as user;
import 'package:preco/repositories/user/user_repository.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../widgets/standard_elevated_button.dart';

class RegistrationScreen extends StatefulWidget {
  final PageController pageController;

  const RegistrationScreen({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final FocusNode _firstfocusNode = FocusNode();
  final FocusNode _lastfocusNode = FocusNode();
  bool? isButtonActive1;
  bool? isButtonActive2;

  @override
  void initState() {
    _firstNameController.text = SessionHelper.firstName ?? "";
    _secondNameController.text = SessionHelper.lastName ?? "";
    isButtonActive1 = _firstNameController.text != "" ? true : false;
    isButtonActive2 = _secondNameController.text != "" ? true : false;
    _firstfocusNode.requestFocus();
    _firstNameController.addListener(() {
      setState(() {
        isButtonActive1 = _firstNameController.text.isNotEmpty;
      });
    });
    _secondNameController.addListener(() {
      setState(() {
        isButtonActive2 = _secondNameController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _firstfocusNode.dispose();
    _lastfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  "What's your full name?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "People use their real name at Idea Foundation",
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8.h,
                          width: 30.w,
                          child: TextField(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            controller: _firstNameController,
                            focusNode: _firstfocusNode,
                            onSubmitted: (_) {
                              _lastfocusNode.requestFocus();
                            },
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              filled: true,
                              hintText: "First",
                              hintStyle: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        SizedBox(
                          height: 8.h,
                          width: 30.w,
                          child: TextField(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            focusNode: _lastfocusNode,
                            controller: _secondNameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              filled: true,
                              hintText: "Last",
                              hintStyle: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            StandardElevatedButton(
              isArrowButton: true,
              labelText: "Continue",
              onTap: () async {
                widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                SessionHelper.firstName = _firstNameController.text;
                SessionHelper.lastName = _secondNameController.text;
                SessionHelper.displayName = _firstNameController.text +
                    " " +
                    _secondNameController.text;
                await UserRepository().setUser(
                  user: 
                  user.User(
                    id: context.read<AuthBloc>().state.user?.uid ?? "",
                    username: SessionHelper.username ?? "",
                    displayName: SessionHelper.displayName ?? "",
                    profileImageUrl: SessionHelper.profileImageUrl ?? '',
                    age: SessionHelper.age ?? '',
                    phone:
                        context.read<AuthBloc>().state.user?.phoneNumber ?? '',
                    followers: 0,
                    following: 0,
                    completed: SessionHelper.completed ?? 0,
                    todo: SessionHelper.todo ?? 0,
                    isPrivate: false,
                    bio: "",
                    walletBalance: 0,
                  ),
                );
              },
              isButtonNull:
                  isButtonActive1 == false || isButtonActive2 == false,
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      ),
    );
  }
}
