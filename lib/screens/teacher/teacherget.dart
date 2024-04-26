import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchDatafoi(String usn) async {
  var url = Uri.parse('https://10.10.0.10/dbms_student/teacher_foi.php');
  var response = await http.post(url, body: {'Teacher_id': usn});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List> getDatainfo() async {
  final response =
      await http.get(Uri.parse("https://10.10.0.10/dbms_student/teacher.php"));
  print(jsonDecode(response.body));
  return jsonDecode(response.body);
}

Future<List<dynamic>> fetchDataprojt(String usn) async {
  var url =
      Uri.parse('https://192.168.0.141/dbms_student/teacher_projects.php');
  var response = await http.post(url, body: {'Teacher_id': usn});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}
