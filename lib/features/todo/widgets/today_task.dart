import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/models/task_model.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_proj/features/todo/pages/update_task.dart';
import 'package:todo_proj/features/todo/widgets/todo_tile.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData.where((e) => e.isCompleted == 0 && e.date!.contains(today)).toList();
    
    
    return ListView.builder(
      itemCount: todayList.length ,
      itemBuilder: (context,index){
        final data = todayList[index];
        bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          delete: (){
            ref.read(todoStateProvider.notifier).deleteTodo(data.id??0);
          },
          editWidget: GestureDetector(onTap: () {
            titles = data.title.toString();
            descs = data.desc.toString();
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => UpdateTask(data.id??0)));
          },
          child: const Icon(MaterialCommunityIcons.circle_edit_outline),
          ),
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          color: color,
          switcher: Switch(
            value: isCompleted, 
            onChanged: (value){
                ref.read(todoStateProvider.notifier).markAsComplete(
                  data.id??0, 
                  data.title.toString(), 
                  data.desc.toString(), 
                  1, 
                  data.date.toString(), 
                  data.startTime.toString(), 
                  data.endTime.toString());

            }),
        );
      }
      );
  }
}
