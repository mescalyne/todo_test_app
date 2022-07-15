class TaskDto {
  int? id;
  int? userId;
  String? title;
  String? dueOn;
  String? status;

  TaskDto({this.id, this.userId, this.title, this.dueOn, this.status});

  TaskDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = json['user_id'] as int;
    title = json['title'] as String;
    dueOn = json['due_on'] as String;
    status = json['status'] as String;
  }
}
