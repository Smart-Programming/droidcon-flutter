import 'package:flutter/material.dart';
import 'package:droidcon_flutter/src/application/utils/text_form_field_widget.dart';
import 'package:droidcon_flutter/src/application/utils/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  DialogBox({super.key, required this.onSave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      actions: <Widget>[
        Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Center(
                child: Text(
              'Add New Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormFieldWidget(
                  title: 'Task name',
                  controller: controller,
                  prefixIcon: Icons.task,
                  keyBoardType: TextInputType.text),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(title: 'Save', color: Colors.green, onPressed: onSave),
                MyButton(
                    title: 'Cancel',
                    color: Colors.red,
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
