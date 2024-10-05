import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/common/widgets/xpansion_tile.dart';
import 'package:todo_proj/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_proj/features/todo/controllers/xpansion_provider.dart';
import 'package:todo_proj/features/todo/widgets/todo_tile.dart';

class DayAfterTomarow extends ConsumerWidget {
  const DayAfterTomarow({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfter = ref.read(todoStateProvider.notifier).getAfterTomorrow();
    var dayafterList = todos.where((e)=>e.date!.contains(dayAfter)).toList();

    return XpansionTile(
                text: "Tomorrow's Task", 
                text2: "Tomorrow's tasks are shown here", 
                onExpansionChanged: (bool expanded){ 
                  ref.read(xpansionStateProvider.notifier)
                  .setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ref.watch(xpansionStateProvider)
                  ? const Icon(AntDesign.circledown,color: AppConst.kLight ,)
                  : const Icon(AntDesign.closecircleo,color: AppConst.kBlueLight),
                ),
                children: [
                  for(final todo in dayafterList)
                  TodoTile(
                    title: todo.title,
                    description: todo.desc,
                    color: color,
                    start: todo.startTime,
                    end: todo.endTime,
                    delete: (){
                          ref.read(todoStateProvider.notifier).deleteTodo(todo.id??0);
                        },
                        editWidget: GestureDetector(onTap: () {},
                        child: const Icon(MaterialCommunityIcons.circle_edit_outline),
                        ),
                    switcher: const SizedBox.shrink() 
                    ),
                ]);
  }
}