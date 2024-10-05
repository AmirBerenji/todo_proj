import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/models/task_model.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_proj/features/todo/widgets/todo_tile.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30days().toList();
    var taskList = listData.where((e) => e.isCompleted == 1 || lastMonth.contains(e.date!.substring(0,10))).toList();
    
    
    return ListView.builder(
      itemCount: taskList.length ,
      itemBuilder: (context,index){
        final data = taskList[index];
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          delete: (){
            ref.read(todoStateProvider.notifier).deleteTodo(data.id??0);
          },
          editWidget: const SizedBox.shrink(),
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          color: color,
          switcher: const Icon(AntDesign.checkcircle,color: AppConst.kGreen,)
        );
      }
      );
  }
}
