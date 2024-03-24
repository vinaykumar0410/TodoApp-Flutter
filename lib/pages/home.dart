import 'package:flutter/material.dart';
import 'package:todolist/utils/dialog_box.dart';
import 'package:todolist/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();

  final List list = [
    ['first', false],
    ['second', false],
    ['third', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      list[index][1] = !list[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    void saveNewTask() {
      if (textController.text != '') {
        setState(() {
          list.add([textController.text, false]);
          textController.clear();
        });
      }
      Navigator.of(context).pop();
    }

    void deleteTask(index) {
      setState(() {
        list.removeAt(index);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('T O D O L I S T',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: list.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/home.jpg'),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Make a List of Things',
                    style:
                        TextStyle(fontSize: 24, color: Colors.lightBlue[300]),
                  ),
                  Text(
                    'You Have',
                    style:
                        TextStyle(fontSize: 24, color: Colors.lightBlue[400]),
                  ),
                  const Text(
                    'To-Do',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: list[index][0],
                  isChecked: list[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.lightBlue[200],
        onPressed: () => showDialog(
          context: context,
          builder: (context) => DialogBox(
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
            controller: textController,
          ),
        ),
        elevation: 0,
        tooltip: 'Add a Task',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
