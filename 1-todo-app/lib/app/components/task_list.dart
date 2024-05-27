import 'package:bloc_cubit_todo/app/components/task_item.dart';
import 'package:bloc_cubit_todo/app/cubits/todo_filtered/todo_filtered_cubit.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoFilteredCubit, TodoFilteredState>(
        builder: (context, state) {
      if (state.filteredTodos.isEmpty) {
        return const Center(
          child: Text(
            "No tasks found",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      }
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: state.filteredTodos.length,
        itemBuilder: (context, index) {
          return TaskItem(
            todo: state.filteredTodos[index],
          );
        },
      );
    });
  }
}
