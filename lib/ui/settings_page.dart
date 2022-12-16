import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco/config/session_helper.dart';
import 'package:preco/login/widgets/standard_elevated_button.dart';
import 'package:preco/repositories/user/user_repository.dart';
import 'package:preco/ui/privacy_policy.dart';
import 'package:preco/ui/terms_and_conditions.dart';
import 'package:sizer/sizer.dart';

import '../blocs/auth/auth_bloc.dart';
import '../model/user_model.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  bool isSaving = false;

  @override
  void initState() {
    lastNameController.text = SessionHelper.displayName!
        .substring(SessionHelper.displayName!.lastIndexOf(" ") + 1);
    firstNameController.text = SessionHelper.displayName!
        .substring(0, SessionHelper.displayName!.lastIndexOf(' '));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: new Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: firstNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "FirstName", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: new Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: lastNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "LastName", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              isSaving
                  ? LinearProgressIndicator()
                  : StandardElevatedButton(
                      isButtonNull: firstNameController.text.isEmpty ||
                          lastNameController.text.isEmpty,
                      labelText: "Save Changes",
                      onTap: () async {
                        setState(() {
                          isSaving = true;
                        });
                        await context
                            .read<UserRepository>()
                            .getUserWithId(
                                userId:
                                    context.read<AuthBloc>().state.user?.uid ??
                                        "")
                            .then((user) async {
                          SessionHelper.firstName = firstNameController.text;
                          SessionHelper.lastName = lastNameController.text;
                          SessionHelper.displayName =
                              "${firstNameController.text} ${lastNameController.text}";
                          User updateUser = user.copyWith(
                              displayName: SessionHelper.displayName);
                          await context
                              .read<UserRepository>()
                              .updateUser(user: updateUser);
                        });
                        setState(() {
                          isSaving = false;
                        });
                      },
                    ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Privacy Policy & Terms and Conditions",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicy()),
                    );
                  },
                  title: Text("Privacy Policy"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditions()),
                    );
                  },
                  title: Text("Terms and Conditions"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
