class TodoModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  TodoModel({
   required this.id,
   required this.title,
   required this.description,
   required this.isCompleted,
  });


  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json["_id"] ?? '',
    title: json["title"] ?? 'No Title',
    description: json["description"] ?? 'No Description',
    isCompleted: json["is_completed"] ?? false,);


  Map<String, dynamic> toJson() => {
   "_id": id,
   "title": title,
   "description": description,
   "is_completed": isCompleted,
  };  
}