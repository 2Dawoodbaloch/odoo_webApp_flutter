enum Sex {
  male,
  female,
  other;

  String get label {
    switch (this) {
      case Sex.male:
        return "Male";
      case Sex.female:
        return "Female";
      case Sex.other:
        return "Other";
    }
  }
}

enum PayCategory {
  employee,
  worker,
  student,
  trainee;

  String get label {
    switch (this) {
      case PayCategory.employee:
        return "Employee";
      case PayCategory.worker:
        return "Worker";
      case PayCategory.student:
        return "Student";
      case PayCategory.trainee:
        return "Trainee";
    }
  }
}

enum ScheduleType {
  fullTime,
  partTime,
  flexible;

  String get label {
    switch (this) {
      case ScheduleType.fullTime:
        return "Full Time";
      case ScheduleType.partTime:
        return "Part Time";
      case ScheduleType.flexible:
        return "Flexible";
    }
  }
}