import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final void Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isChecked,
    required this.onChanged,
    this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.lightBlue[200]),
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: onChanged,
                  activeColor: Colors.black),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    taskName,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 2,
                        fontSize: 18,
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
