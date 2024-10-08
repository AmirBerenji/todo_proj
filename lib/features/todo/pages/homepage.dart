import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/custome_text.dart';
import 'package:todo_proj/common/widgets/hight_spacer.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/common/widgets/width_spacer.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_proj/features/todo/pages/add.dart';
import 'package:todo_proj/features/todo/widgets/completed_task.dart';
import 'package:todo_proj/features/todo/widgets/day_after_tomarrow.dart';
import 'package:todo_proj/features/todo/widgets/today_task.dart';
import 'package:todo_proj/features/todo/widgets/tomorrow_list.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> with TickerProviderStateMixin{

late final TabController tabcontroller = TabController(
  length: 2, vsync: this);
final TextEditingController search = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
           child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResuableText(text: "Dashboard", 
                    style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTask()));
                        },
                        child: const Icon(Icons.add,color: AppConst.kBkDark,),
                      ),
                    )
                  ],
                ),
                ),
                const HieghtSpacer(height: 20),
                CustomTextField(
                  hintText: "Search", 
                  controller: search,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(AntDesign.search1,color: AppConst.kGreyLight,),
                    ),
                  ),
                  suffixIcon: const Icon(FontAwesome.sliders,color: AppConst.kGreyLight,)
                  ),
                  const HieghtSpacer(height: 15),

            ],
           )),
      ),
      body: SafeArea(child: Padding(
        padding: 
        EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
           children: [
              const HieghtSpacer(height: 25),

              Row(
                children: [
                  const Icon(FontAwesome.tasks,size: 20,color:AppConst.kLight),
                  const WidthSpacer(width: 10),
                  ResuableText(text: "Today's Task", 
                  style: appstyle(18, AppConst.kLight, FontWeight.bold) )
                ],
              ),
              const HieghtSpacer(height: 25),
              Container(
                decoration: const BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))
                ),
                child: TabBar( 
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  ),
                  controller: tabcontroller,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle: appstyle(12, AppConst.kBlueLight, FontWeight.w700),
                  unselectedLabelColor:  AppConst.kLight,                  
                  tabs: [
                    Tab(
                      child: SizedBox(width: AppConst.kWidth*0.5,
                      child: Center(
                        child: ResuableText(
                          text: "Pending", 
                          style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                      ),),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppConst.kWidth*0.5,
                        child: Center(
                          child: ResuableText(
                            text: "Completed", 
                            style: appstyle(16, AppConst.kBkDark, FontWeight.bold)),
                        ),),
                    )
                  ],
                  ),
              ),

              const HieghtSpacer(height: 20),

              SizedBox(
                height: AppConst.kHieght*0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(
                    controller: tabcontroller,  
                    children: [
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHieght*0.3,
                        child: const TodayTask(),
                      ),
                      Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHieght*0.3,
                        child: const CompletedTask(),
                      ),
                    ]),
                ),
              ),

              const HieghtSpacer(height: 20),
              
              const TomorrowList(),

              const HieghtSpacer(height: 20),

              const DayAfterTomarrow()

           ], 
        ),
        ),
      )
    );
  }
}



