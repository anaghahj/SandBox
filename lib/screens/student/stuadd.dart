import 'package:http/http.dart' as http;

String ip = "10.10.0.10";
addstu(usn, name, sem, sec, dept, cgpa) {
  print(usn + name + sem + sec + dept + cgpa);
  var url = Uri.parse("https://$ip/dbms_student/student_insert.php");
  http.post(url, body: {
    'USN': usn,
    'Name': name,
    'Semester': sem,
    'Section': sec,
    'Department': dept,
    'CGPA': cgpa
  });
}

addcaa(usn, name, type, start, end) {
  print(usn + name + type + start + end);
  var url = Uri.parse("https://$ip/dbms_student/course_activities_insert.php");
  http.post(url, body: {
    'USN': usn,
    'Name': name,
    'Type': type,
    'Date_start': start,
    'Date_end': end
  });
}

addfoi(usn, foi, exp) {
  var url = Uri.parse("https://$ip/dbms_student/student_foi_insert.php");
  http.post(url, body: {'USN': usn, "FoI": foi, "Experience": exp});
}
