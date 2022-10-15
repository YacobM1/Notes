import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_todo.dart';
import '../widgets/add_text_widget.dart';
import '../widgets/note_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitTodo(),
      child: BlocConsumer<CubitTodo, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ReadeToWorkState || state is UpdatedListState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Note Book',
                  style: TextStyle(fontSize: 22),
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.yellow[200],
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AddTextWidget(
                      todoList: state.getNotes,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.getNotes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NoteItem(
                              prefsList: state.getNotes,
                              index: index,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              children: [
                const Text('Something went wrong!'),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Try again!'))
              ],
            ),
          );
        },
      ),
    );
  }
}
