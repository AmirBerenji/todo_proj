
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/custom_otl_btn.dart';
import 'package:todo_proj/common/widgets/custome_text.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:todo_proj/features/todo/controllers/dates/dates_provider.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask(this.id, {super.key});

  final int id;

  @override
  ConsumerState<UpdateTask> createState() => _UpdateTask();
}

class _UpdateTask extends ConsumerState<UpdateTask> {
  
  final TextEditingController title = TextEditingController(text: titles);
  final TextEditingController desc = TextEditingController(text: descs);
  
  @override
  Widget build(BuildContext context) {

    var schedualDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var end = ref.watch(finishTimeStateProvider);

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
                onTap: (){
                   picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2024, 10, 3),
                      maxTime: DateTime(2028, 10, 3),
                      theme: const picker.DatePickerTheme(
                          itemStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: AppConst.kGreen , fontSize: 16)),
                      onConfirm: (date) {
                        ref.read(dateStateProvider.notifier).setDate(date.toString());
                       }, 
                  currentTime: DateTime.now(), 
                  locale: picker.LocaleType.en);
                },
                width: AppConst.kWidth, 
                height: 52.h,
                borderColor: AppConst.kLight,
                color: AppConst.kBlueLight, 
                text: schedualDate==""? "Set Date" : schedualDate.substring(0,10)),

                const HieghtSpacer(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOtlnBtn(
                      onTap: (){
                          picker.DatePicker.showTimePicker(context,
                          showTitleActions: true, 
                          onChanged: (date) {}, 
                          onConfirm: (date) { 
                            ref.read(startTimeStateProvider.notifier).setStart(date.toString());
                          }, 
                          currentTime: DateTime.now());
                      },
                      width: AppConst.kWidth * 0.4, 
                      height: 52.h,
                      borderColor: AppConst.kLight,
                      color: AppConst.kBlueLight, 
                      text: start == "" ? "Start Time":start.substring(10,16)),

                      CustomOtlnBtn(
                        onTap: (){
                          picker.DatePicker.showTimePicker(context,
                          showTitleActions: true, 
                          onChanged: (date) {}, 
                          onConfirm: (date) {
                            ref.read(finishTimeStateProvider.notifier).setEnd(date.toString());
                          }, 
                          currentTime: DateTime.now());
                      }, 
                        width: AppConst.kWidth * 0.4, 
                        height: 52.h,
                        borderColor: AppConst.kLight,
                        color: AppConst.kBlueLight, 
                        text: end == ""? "End Time" : end.substring(10,16) ),
                  ],
                ),

                const HieghtSpacer(height: 20),

                CustomOtlnBtn(
                  onTap: (){
                    if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      schedualDate.isNotEmpty &&
                      start.isNotEmpty &&
                      end.isNotEmpty) {
                      // Task task = Task(
                      //   title: title.text,
                      //   desc: desc.text,
                      //   isCompleted: 0,
                      //   date: schedualDate,
                      //   startTime: start.substring(10,16),
                      //   endTime: end.substring(10,16),
                      //   remind: 0,
                      //   repeat: "yes"
                      // );
                      
                      ref.read(todoStateProvider.notifier).updateItem(
                        widget.id,
                        title.text,
                        desc.text,
                        0,
                        schedualDate,
                        start.substring(10,16),
                        end.substring(10,16)
                      );
                      
                      ref.read(finishTimeStateProvider.notifier).setEnd("");
                      ref.read(startTimeStateProvider.notifier).setStart("");
                      ref.read(dateStateProvider.notifier).setDate("");

                      Navigator.pop(context);
                    } else {
                      print("faild to add task");
                    }
                  },
                  width: AppConst.kWidth * 0.4, 
                  height: 52.h,
                  borderColor: AppConst.kLight,
                  color: AppConst.kGreen, 
                  text: "Edit"),

          ],
        ),
        ),
    );
  }
}