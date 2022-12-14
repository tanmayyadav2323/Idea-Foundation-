import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Our Team",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.black)),
                child: Image.network(
                  "https://ideafoundation.org.in/wp-content/uploads/2022/10/IDEA-Team-2-1200x540.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "About Us...",
                style: TextStyle(fontSize: 20.sp, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 3.h),
              Text(
                "Foundation for Initiatives in Development and Education for All (IDEA) is a NON-PROFIT organization based in Pune, serving underprivileged CHILDREN and WOMEN through EDUCATIONAL and SKILLING programmes.",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    wordSpacing: 1),
              ),
              Text(
                "\nIDEA originated from the findings of a PhD study by Dr. Usha Pillai to deal with the problems in education and developmental issues of the marginalized people. Realizing the need for adopting a holistic approach to minimize school dropout, IDEA started its work in a slum in 2002 with a study centre and later expanded its work to include educational sponsorship for High school children and also started Skill development courses for women and youth since 2008.",
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nCurrently IDEA runs 5 core programmes –',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nUTKARSH – Community based Study centres for children',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nUDAAN – Educational sponsorship for deserving & needy  children',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nASHAKIRAN – Skill development courses for women and youth',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nUNNATI -Entrepreneurial Development Programme (EDP) to encourage women to start their own business',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              ),
              Text(
                '\nE-SAKSHAR– Digital Literacy programme for all',
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 1),
              )
            ],
          ),
        ),
      )),
    );
  }
}
