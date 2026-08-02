void main() {
  // Student Info
  String name = "John Doe";
  int rollNo = 101;
  String course = "BCA";
  int sem = 3;

  // Initial Marks
  int sub1 = 85;
  int sub2 = 78;
  int sub3 = 91;
  sub1 += 5;

  // Calculations
  int total = sub1 + sub2 + sub3;
  double avg = total / 3;
  double percent = (total / 300) * 100;
  bool isPassed = percent >= 40;
  print("==========================================");
  print("         STUDENT RESULT REPORT            ");
  print("==========================================");
  print("Student Name : " + name);
  print("Roll Number  : $rollNo");
  print("Course       : $course");
  print("Semester     : $sem");
  print("");
  print("Subject 1    : $sub1");
  print("Subject 2    : $sub2");
  print("Subject 3    : $sub3");
  print("Total Marks  : $total");
  print("Average      : " + avg.toStringAsFixed(2));
  print("Percentage   : " + percent.toStringAsFixed(2) + "%");
  
  if (isPassed) {
    print("Result       : Pass");
  } else {
    print("Result       : Fail");
  }
  print("==========================================");
}