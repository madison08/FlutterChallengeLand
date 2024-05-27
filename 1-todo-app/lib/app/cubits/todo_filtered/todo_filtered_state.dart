// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filtered_cubit.dart';

class TodoFilteredState extends Equatable {
  final List<Todo> filteredTodos;
  const TodoFilteredState({required this.filteredTodos});

  factory TodoFilteredState.initial() {
    return const TodoFilteredState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  TodoFilteredState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return TodoFilteredState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
