import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_todo.dart';

class AddTextWidget extends StatefulWidget {
  const AddTextWidget({Key? key, required this.todoList}) : super(key: key);
  final List<String> todoList;

  @override
  State<AddTextWidget> createState() => _AddTextWidgetState();
}

class _AddTextWidgetState extends State<AddTextWidget> {
  TextEditingController controller = TextEditingController();

  bool isEnableButton = false;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        isEnableButton = controller.value.text.isNotEmpty ? true : false;
      });
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 20, height: 1),
            ),
            onPressed: isEnableButton ? () => _addNewNotes(context) : null,
            child: const Text(
              'Add',
            ),
          ),
        ),
      ],
    );
  }

  void _addNewNotes(BuildContext context) {
    final newList = [controller.value.text, ...widget.todoList];
    context.read<CubitTodo>().addNewNotes(newList);
    controller.clear();
  }
}
