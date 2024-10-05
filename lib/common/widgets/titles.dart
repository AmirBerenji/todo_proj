import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/common/widgets/width_spacer.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({super.key, required this.text, required this.text2,  this.clr});

final String text;
final String text2;
final Color? clr;
  @override
  Widget build(BuildContext context) {
    return SizedBox
    (width: AppConst.kWidth ,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer(
            builder: (context,ref,child){
              var color = ref.read(todoStateProvider.notifier).getRandomColor();
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  color: color,
                ),
              );
            }
          ),
          const WidthSpacer(width: 15),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResuableText(
                  text: text, 
                  style: appstyle(24, AppConst.kLight, FontWeight.bold)),
                  const HieghtSpacer(height: 10),
                  ResuableText(
                  text: text2, 
                  style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                  
              ],  
            ),)
        ],
      ),),
      );
  }
}