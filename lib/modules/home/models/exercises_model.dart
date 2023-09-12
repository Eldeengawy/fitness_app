class ExercisesModel {
  List<Exercise>? exercises;

  ExercisesModel({this.exercises});

  ExercisesModel.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <Exercise>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;

  Exercise({this.id, this.title, this.thumbnail, this.gif, this.seconds});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['gif'] = gif;
    data['seconds'] = seconds;
    return data;
  }
}
