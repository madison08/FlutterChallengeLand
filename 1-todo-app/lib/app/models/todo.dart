// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter { active, completed, all }

Uuid uuid = Uuid();

class Todo extends Equatable {
  final String id;
  final String description;
  final bool completed;

  Todo({
    String? id,
    required this.description,
    required this.completed,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, description, completed];

  @override
  String toString() {
    return 'Todo { id: $id, description: $description, completed: $completed }';
  }
}
