import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_todo/app/cubits/cubits.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_filtered_state.dart';

class TodoFilteredCubit extends Cubit<TodoFilteredState> {
  late StreamSubscription todoFilteredSubscription;
  late StreamSubscription searchSubscription;
  late StreamSubscription todolistSubscription;

  final SearchCubit searchCubit;
  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;

  final List<Todo> initialFilteredTodos;
  TodoFilteredCubit({
    required this.searchCubit,
    required this.todoListCubit,
    required this.todoFilterCubit,
    required this.initialFilteredTodos,
  }) : super(
          TodoFilteredState(filteredTodos: initialFilteredTodos),
        ) {
    todoFilteredSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    searchSubscription =
        searchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todolistSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (searchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.description
              .toLowerCase()
              .contains(searchCubit.state.searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilteredSubscription.cancel();
    searchSubscription.cancel();
    todolistSubscription.cancel();
    return super.close();
  }
}
