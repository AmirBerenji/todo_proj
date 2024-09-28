import 'package:flutter/material.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        
        child:  ResuableText(text: "Todo with riverpod",
         style: appstyle(26,AppConst.kBlueLight,FontWeight.bold) ),
      ),
    );
  }
}


