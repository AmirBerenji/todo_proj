import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/custom_otl_btn.dart';
import 'package:todo_proj/common/widgets/custome_text.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

   final TextEditingController phone = TextEditingController();

   Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Image.asset("assets/images/todo.png",width:300 ,)),
          const HieghtSpacer(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w,),
            child: ResuableText(text: "Please enter your phone number", 
            style: appstyle(17, AppConst.kLight, FontWeight.w500)),
          ),
          const HieghtSpacer(height: 80),
          Center(
            child: CustomTextField(
              controller: phone,

              prefixIcon: Container(
                padding: const EdgeInsets.all(14),
                child: GestureDetector(
                  onTap: () {
                    showCountryPicker(context: context,
                    countryListTheme: const CountryListThemeData(
                      backgroundColor: AppConst.kLight,
                      bottomSheetHeight: AppConst.kHieght *0.6,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConst.kRadius),
                        topRight: Radius.circular(AppConst.kRadius),

                      )
                    ),
                     onSelect: (code){
                      setState(() {});
                     });
                  },
                  child: ResuableText(
                    text: "${country.flagEmoji} + ${country.phoneCode}", 
                    style: appstyle(18, AppConst.kBkDark, FontWeight.bold)
                    ),
                ),
              ),
              
              keyboardType: TextInputType.phone,
              hintText: "Enter phone number",
              hintStyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
            ),
          ),
          const HieghtSpacer(height: 20),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomOtlnBtn(
              onTap: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const OtpPage()));
              },
              width: AppConst.kWidth*0.9, 
              height: AppConst.kHieght*0.075, 
              borderColor: AppConst.kBkDark,
              color: AppConst.kLight,
              text: "Send Code"),
          )

        ],
      ),),
      ),
    );
  }
}