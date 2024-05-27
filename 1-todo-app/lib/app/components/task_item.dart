import 'package:bloc_cubit_todo/app/cubits/cubits.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:bloc_cubit_todo/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final Todo todo;

  const TaskItem({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.tertiaryColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
            leading: InkWell(
              onTap: () {
                context.read<TodoListCubit>().toggleTodo(todo.id);
              },
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: todo.completed
                    ? const BoxDecoration(
                        color: AppColors.doneColor,
                        shape: BoxShape.circle,
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.secondaryColor,
                          width: 2.0,
                        ),
                      ),
              ),
            ),
            title: Text(
              todo.description,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20.0,
                decoration: todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.tertiaryColor,
                            title: const Text(
                              "Edit Task",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            content: TextField(
                              controller:
                                  TextEditingController(text: todo.description),
                              cursorColor: AppColors.secondaryColor,
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                              ),
                              onSubmitted: (value) {
                                if (value != null) {
                                  context
                                      .read<TodoListCubit>()
                                      .updateTodo(todo.id, value);
                                  Navigator.of(context).pop();
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                                fillColor: AppColors.tertiaryColor,
                                filled: true,
                                hintText: "Edit your task...",
                                hintStyle: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel",
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                    )),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TodoListCubit>().removeTodo(todo.id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
