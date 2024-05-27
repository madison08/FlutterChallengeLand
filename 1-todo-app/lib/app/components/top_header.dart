import 'package:bloc_cubit_todo/app/cubits/todo_active_count/todo_active_cubit.dart';
import 'package:bloc_cubit_todo/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            bottom: 25,
            left: 35,
            right: 35,
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Todo Done",
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Keep it up!",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              BlocBuilder<TodoActiveCountCubit, TodoActiveCountState>(
                builder: (context, state) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${state.doneTodoCount}/${state.activeTodoCount}",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
