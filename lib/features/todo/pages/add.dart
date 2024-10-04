
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/custom_otl_btn.dart';
import 'package:todo_proj/common/widgets/custome_text.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTask();
}

class _AddTask extends ConsumerState<AddTask> {
  
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HieghtSpacer(height: 20),

            CustomTextField(
              hintText: "Add Title", 
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
              ),

              const HieghtSpacer(height: 20),

              CustomTextField(
              hintText: "Add Description", 
              controller: desc,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
              ),

              const HieghtSpacer(height: 20),

              CustomOtlnBtn(
                width: AppConst.kWidth, 
                height: 52.h,
                borderColor: AppConst.kLight,
                color: AppConst.kBlueLight, 
                text: "Set Date"),

                const HieghtSpacer(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOtlnBtn(
                      onTap: (){

                      },
                      width: AppConst.kWidth * 0.4, 
                      height: 52.h,
                      borderColor: AppConst.kLight,
                      color: AppConst.kBlueLight, 
                      text: "Start Time"),

                      CustomOtlnBtn(
                        onTap: (){

                        },
                        width: AppConst.kWidth * 0.4, 
                        height: 52.h,
                        borderColor: AppConst.kLight,
                        color: AppConst.kBlueLight, 
                        text: "End Time"),
                  ],
                ),

                HieghtSpacer(height: 20),

                CustomOtlnBtn(
                  onTap: (){

                  },
                  width: AppConst.kWidth * 0.4, 
                  height: 52.h,
                  borderColor: AppConst.kLight,
                  color: AppConst.kGreen, 
                  text: "Submit"),

          ],
        ),
        ),
    );
  }
}