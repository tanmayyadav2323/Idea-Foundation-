import 'package:flutter/material.dart';
import 'package:preco/login/widgets/standard_elevated_button.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RaiseQueryPage extends StatefulWidget {
  RaiseQueryPage({Key? key}) : super(key: key);

  @override
  State<RaiseQueryPage> createState() => _RaiseQueryPageState();
}

class _RaiseQueryPageState extends State<RaiseQueryPage> {
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Raise Query",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(height: 8.h),
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
                      controller: subjectController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Please Type Your Question",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 4.h),
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
                      controller: bodyController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter in detail",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                      minLines: 8,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  StandardElevatedButton(
                    onTap: () async {
                      String email =
                          Uri.encodeComponent("tanmayyadav2323@gmail.com");
                      String subject = Uri.encodeComponent(
                          "Query: " + subjectController.text);
                      String body = Uri.encodeComponent(bodyController.text);
                      print(subject); //output: Hello%20Flutter
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        //email app opened
                      } else {
                        //email app is not opened
                      }
                    },
                    labelText: "Mail Us",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(child: Text("We will mail you back shortly 🙂"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
