import 'package:bloc_cubit_todo/app/app.dart';
import 'package:bloc_cubit_todo/app/cubits/cubits.dart';
import 'package:bloc_cubit_todo/app/cubits/todo_filtered/todo_filtered_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<TodoActiveCountCubit>(
          create: (context) => TodoActiveCountCubit(
            initialActiveCount:
                context.read<TodoListCubit>().state.todos.length,
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
        BlocProvider<TodoFilteredCubit>(
          create: (context) => TodoFilteredCubit(
            initialFilteredTodos: context.read<TodoListCubit>().state.todos,
            searchCubit: BlocProvider.of<SearchCubit>(context),
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const App(),
      ),
    );
  }
}
