import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/keys.dart';

part 'state_todo.dart';

class CubitTodo extends Cubit<TodoState> {
  CubitTodo() : super(const InitialState()) {
    init();
  }

  late final SharedPreferences preferences;
  late List<String> notes;

  void init() async {
    try {
      emit(const LoadingState());
      preferences = await SharedPreferences.getInstance();
      notes = preferences.getStringList(listKey) ?? [];
      emit(ReadeToWorkState(notes: notes));
    } catch (e){
      emit(const ErrorState(message: 'Something went wrong!'));
    }
  }

  void addNewNotes(List<String> listNotes) {
    emit(const LoadingState());
    preferences.setStringList(listKey, listNotes);
    notes = preferences.getStringList(listKey) ?? [];
    emit(UpdatedListState(notes: notes));
  }

  void removeNote(int index) {
    emit(const LoadingState());
    notes = preferences.getStringList(listKey) ?? [];
    notes.removeAt(index);
    addNewNotes(notes);
  }
}
