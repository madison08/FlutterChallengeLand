import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_todo/app/cubits/todo_list/todo_list_cubit.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_active_state.dart';

class TodoActiveCountCubit extends Cubit<TodoActiveCountState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  final int initialActiveCount;
  TodoActiveCountCubit(
      {required this.todoListCubit, required this.initialActiveCount})
      : super(TodoActiveCountState(activeTodoCount: 0, doneTodoCount: 0)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      final int currentActiveTodoCount = todoListState.todos.toList().length;
      final int currentDoneTodoCount = todoListState.todos
          .where((Todo todo) => todo.completed == true)
          .toList()
          .length;

      emit(state.copyWith(
          activeTodoCount: currentActiveTodoCount,
          doneTodoCount: currentDoneTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
