import 'package:bloc_cubit_todo/app/components/button.dart';
import 'package:bloc_cubit_todo/app/components/task_list.dart';
import 'package:bloc_cubit_todo/app/components/top_header.dart';
import 'package:bloc_cubit_todo/app/cubits/cubits.dart';
import 'package:bloc_cubit_todo/app/cubits/todo_filtered/todo_filtered_cubit.dart';
import 'package:bloc_cubit_todo/app/models/todo.dart';
import 'package:bloc_cubit_todo/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      const TopHeader(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: AppColors.secondaryColor,
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<SearchCubit>()
                                      .setSearchTerm(value);
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                                fillColor: AppColors.tertiaryColor,
                                filled: true,
                                hintText: "Search your task...",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.primaryColor,
                                ),
                                prefixStyle: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
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
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Buttom(),
                        ],
                      ),
                      TabBar(
                        indicatorColor: AppColors.secondaryColor,
                        unselectedLabelColor: AppColors.primaryColor,
                        labelColor: AppColors.secondaryColor,
                        onTap: (int tap) {
                          if (tap == 0) {
                            context
                                .read<TodoFilterCubit>()
                                .updateFilter(Filter.all);
                          } else if (tap == 1) {
                            context
                                .read<TodoFilterCubit>()
                                .updateFilter(Filter.active);
                          } else if (tap == 2) {
                            context
                                .read<TodoFilterCubit>()
                                .updateFilter(Filter.completed);
                          }
                        },
                        tabs: [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "Active",
                          ),
                          Tab(
                            text: "Done",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: TabBarView(children: [
                    TaskList(),
                    TaskList(),
                    TaskList(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
