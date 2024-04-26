import 'package:http/http.dart' as http;

String ip = "10.10.0.10";
addteach(
  usn,
  name,
  dept,
  phone,
) {
  print(usn + name + dept + phone);
  var url = Uri.parse("https://$ip/dbms_student/teacher_insert.php");
  http.post(url, body: {
    "Teacher_id": usn,
    'Name': name,
    'Department': dept,
    'Phone': phone,
  });
}

addproj(
  usn,
  name,
) {
  print(usn + name);
  var url = Uri.parse("https://$ip/dbms_student/teacher_project_insert.php");
  http.post(url, body: {
    "Teacher_id": usn,
    'Project_name': name,
  });
}

addfoit(usn, foi, exp) {
  var url = Uri.parse("https://$ip/dbms_student/teacher_foi_insert.php");
  http.post(url, body: {"Teacher_id": usn, "FoI": foi, "Experience": exp});
}
