import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoTitle) {
    final newTodo = Todo(description: todoTitle, completed: false);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void updateTodo(String id, String title) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(description: title, completed: todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(description: todo.description, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(String id) {
    final newTodos = state.todos.where((todo) => todo.id != id).toList();

    emit(state.copyWith(todos: newTodos));
  }
}
