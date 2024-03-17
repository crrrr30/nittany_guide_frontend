class Semester {
  final String year;
  final List<String> classes;

  const Semester(this.year, this.classes);

  factory Semester.fromJSON(Map<String, dynamic> json) => switch (json) {
        {"year": String year, "classes": List classes} => Semester(year,
            classes.map<String>((classJSON) => classJSON['code']).toList()),
        _ => throw const FormatException("Bad semester format."),
      };
}

class Recommendation {
  final String userMessage;
  final List<Semester> semesters;

  const Recommendation(this.userMessage, this.semesters);

  factory Recommendation.fromJSON(Map<String, dynamic> json) => switch (json) {
        {
          "user_message": String userMessage,
          "semesters": List semesters,
        } =>
          Recommendation(
              userMessage,
              semesters
                  .map((semesterJSON) => Semester.fromJSON(semesterJSON))
                  .toList()),
        _ => throw const FormatException("Bad semester format."),
      };
}
