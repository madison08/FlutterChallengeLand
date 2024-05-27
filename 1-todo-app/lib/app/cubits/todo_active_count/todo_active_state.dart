// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_active_cubit.dart';

class TodoActiveCountState extends Equatable {
  final int activeTodoCount;
  final int doneTodoCount;

  const TodoActiveCountState(
      {required this.activeTodoCount, required this.doneTodoCount});

  factory TodoActiveCountState.initial() {
    return const TodoActiveCountState(activeTodoCount: 0, doneTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount, doneTodoCount];

  TodoActiveCountState copyWith({
    int? activeTodoCount,
    int? doneTodoCount,
  }) {
    return TodoActiveCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
      doneTodoCount: doneTodoCount ?? this.doneTodoCount,
    );
  }
}
