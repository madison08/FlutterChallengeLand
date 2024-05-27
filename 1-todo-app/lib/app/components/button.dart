import 'package:bloc_cubit_todo/app/cubits/cubits.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:bloc_cubit_todo/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttom extends StatefulWidget {
  const Buttom({super.key});

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  final TextEditingController _todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: TextField(
                        controller: _todoTextController,
                        cursorColor: AppColors.secondaryColor,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 5,
                          ),
                          fillColor: AppColors.tertiaryColor,
                          filled: true,
                          hintText: "Add your task...",
                          hintStyle: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_todoTextController.text.isNotEmpty &&
                            _todoTextController.text != null) {
                          context.read<TodoListCubit>().addTodo(
                                _todoTextController.text,
                              );
                          _todoTextController.clear();
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
