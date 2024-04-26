import 'dart:convert';

import 'package:http/http.dart' as http;

String ip = "10.10.0.10";
Future<List> getDatainfo() async {
  final response =
      await http.get(Uri.parse("https://$ip/dbms_student/student.php"));
  print(jsonDecode(response.body));
  return jsonDecode(response.body);
}

Future<List<dynamic>> fetchDatafoi(String usn) async {
  var url = Uri.parse('https://$ip/dbms_student/studentproj.php');
  var response = await http.post(url, body: {'USN': usn});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List<dynamic>> fetchDataproj(String usn) async {
  var url = Uri.parse('https://$ip/dbms_student/student_course_activities.php');
  var response = await http.post(url, body: {'USN': usn});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}
