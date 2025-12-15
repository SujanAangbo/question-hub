enum CourseType {
  semester,
  year;

  String get text {
    switch (this) {
      case semester:
        return "Semester";
      case year:
        return "Year";
    }
  }
}
