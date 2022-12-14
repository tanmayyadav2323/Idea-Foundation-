import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:sizer/sizer.dart';

class StandardElevatedButton extends StatelessWidget {
  const StandardElevatedButton({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.isButtonNull = false,
    this.isArrowButton = false,
  }) : super(key: key);

  final String labelText;
  final VoidCallback onTap;
  final bool isButtonNull;
  final bool isArrowButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.black.withOpacity(0.3),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      onPressed: isButtonNull ? null : onTap,
      child: Padding(
        padding:
            EdgeInsets.only(left: 2.w, right: 1.5.w, top: 1.4.h, bottom: 1.4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labelText,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            if (isArrowButton) const SizedBox(width: 5),
            if (isArrowButton)
              Icon(
                LineariconsFree.arrow_right,
                color: Colors.white,
                size: 14.sp,
              )
          ],
        ),
      ),
    );
  }
}
