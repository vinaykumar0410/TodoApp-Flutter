import 'package:flutter/material.dart';
import 'package:todolist/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue[200],
      content: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black, letterSpacing: 2),
              cursorColor: Colors.lightBlue,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: 'Add a Task',
                hintStyle:
                    const TextStyle(color: Colors.black, letterSpacing: 0),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(myText: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                MyButton(myText: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
