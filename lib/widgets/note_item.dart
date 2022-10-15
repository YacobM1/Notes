import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_todo.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.prefsList,
    required this.index,
  }) : super(key: key);

  final List<String> prefsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(prefsList[index]),
      direction: DismissDirection.endToStart,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                prefsList[index],
              ),
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        context.read<CubitTodo>().removeNote(index);
      },
    );
  }
}
