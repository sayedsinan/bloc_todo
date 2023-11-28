part of 'todo_bloc.dart';

enum TodoStatus { inital, loading, success, erroor }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;
  const TodoState({
    this.todos = const <Todo>[],
    this.status = TodoStatus.inital,
  });

  TodoState copywith({
    TodoStatus? status,
    List<Todo>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodoes = (json['todo'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();
      return TodoState(
          todos: listOfTodoes,
          status: TodoStatus.values.firstWhere(
              (element) => element.name.toString() == json['status']));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'todo': todos,
      'status': status.name,
    };
  }

  @override
  List<Object> get props => [todos, status];
}
