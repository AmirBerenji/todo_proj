import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/custom_otl_btn.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/features/auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHieght,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.w, ),
          child: Image.asset("assets/images/todo.png") ,),
          const HieghtSpacer(height: 50),
          CustomOtlnBtn(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => const LoginPage())
                );
            },
            width: AppConst.kWidth*0.9,
            height: AppConst.kHieght*0.06,
            borderColor:AppConst.kLight ,
            text: "login with a phone number"),
        ],
      ),
    );
  }
}