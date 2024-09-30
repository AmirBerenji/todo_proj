import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, this.color, this.title, this.description, this.start, this.end, this.editWidget, this.delete, this.switcher});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget; 
  final Widget? switcher; 
  final void Function()? delete;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 
      EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: const BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        ///TODO: Add dynamic color
                        color: color ?? AppConst.kRed
                      ),
                    ),
                    const WidthSpacer(width: 15),

                    Padding(padding: EdgeInsets.all(8.h),
                    child: SizedBox(
                      width: AppConst.kWidth * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResuableText(
                            text: title?? "Title of Todo", 
                            style: appstyle(18, AppConst.kLight, FontWeight.bold)),

                            const HieghtSpacer(height: 3),

                            ResuableText(
                            text: description?? "Description of Todo", 
                            style: appstyle(12, AppConst.kLight, FontWeight.bold)),

                            const HieghtSpacer(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConst.kWidth*0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.3,
                                      color: AppConst.kGreyDK,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(AppConst.kRadius)),
                                    color:AppConst.kBkDark
                                  ),
                                  child:Center(
                                  child: ResuableText(
                                    text: "$start | $end", 
                                    style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                                  ) ,
                                ),
                                const WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),

                                    WidthSpacer(width: 20),

                                    GestureDetector(
                                      onTap: delete,
                                      child:
                                      Icon(MaterialCommunityIcons.delete_circle) 
                                      ,
                                    )
                                  ],  
                                )
                              ],
                            )
                        ],
                      ),
                    ),)

                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom:0.h),
                  child: switcher,
                )

              ],
            ),
          ),    
        ],
      ),
      );
  }
}