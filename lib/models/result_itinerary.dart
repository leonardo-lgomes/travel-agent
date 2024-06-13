class ResultItinerary {
  String? title;
  String? description;
  List<DayResultItinerary>? days;

  ResultItinerary(this.title, this.description, this.days);
  ResultItinerary.fromJson(Map json){
    title = json['title'];
    description = json['description'];
    if (json['days'] != null) {
      days = <DayResultItinerary>[];
      json['days'].forEach((v) {
        days!.add(DayResultItinerary.fromJson(v));
    });
  }
  }
}

class DayResultItinerary {
  dynamic day;
  String? title;
  String? description;
  List<ActivitiesResultItinerary>? activities;

  DayResultItinerary(this.day, this.title, this.description, this.activities);

  DayResultItinerary.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    title = json['title'];
    description = json['description'];
    if (json['activities'] != null) {
      activities = <ActivitiesResultItinerary>[];
      json['activities'].forEach((v) {
        activities!.add( ActivitiesResultItinerary.fromJson(v));
      });
    }
  }
}

class ActivitiesResultItinerary {
  String? name;
  String? description;
  String? time;
  String? type;

  ActivitiesResultItinerary(this.name, this.description, this.time, this.type);

  ActivitiesResultItinerary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    time = json['time'];
    type = json['type'];
  }

}