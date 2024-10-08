
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';
import 'package:todo_proj/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    String code = ref.watch(codeStateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ResuableText(text: code, 
            style: appstyle(30, AppConst.kLight, FontWeight.bold)),

            TextButton(
              onPressed: (){
                ref.read(codeStateProvider.notifier).setStart("Hello Amir");
              }, 
              child: const Text("Press Me")),

          ],
        ),
      ),
    );
  }
}