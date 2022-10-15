part of 'cubit_todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class InitialState extends TodoState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class UpdatedListState extends TodoState {
  final List<String> notes;

  const UpdatedListState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class LoadingState extends TodoState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class ReadeToWorkState extends TodoState {
  final List<String> notes;

  const ReadeToWorkState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class ErrorState extends TodoState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}


extension TodoStateExtention on TodoState {
  List<String> get getNotes {
    final state = this;
    if (state is UpdatedListState) return state.notes;
    if (state is ReadeToWorkState) return state.notes;
    return [];
  }
}