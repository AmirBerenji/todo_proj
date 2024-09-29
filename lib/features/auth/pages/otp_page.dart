import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const HieghtSpacer(height: AppConst.kHieght*0.15),
             Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
             child: Image.asset("assets/images/todo.png"),),
             const HieghtSpacer(height: 26),
             
             ResuableText(text: "Enter your OTP", style: appstyle(18, AppConst.kLight, FontWeight.bold)),
            const HieghtSpacer(height: 26),
             
             Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value){
                if(value.length == 6) {}
              },
              onSubmitted: (value) {
                if(value.length == 6) {}
              },
             )

          ],
        ),
      )),
    );
  }
}