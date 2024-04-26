import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sandbox/screens/teacher/teacherget.dart';
import 'package:sandbox/screens/teacher/teacherproj.dart';
import 'dart:convert';
import 'package:sandbox/screens/teacher/teacher_foi.dart';

class Teacher extends StatefulWidget {
  const Teacher({Key? key});
  static const id = "Teacher";

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: getDatainfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list?.length ?? 0,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          teacherProject(usn: "${list![i]["Teacher_id"]}")),
                );
              },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 237, 235, 1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(221, 200, 198, 1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list![i]["Name"]}, ${list![i]["Department"]}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PHONE: ${list![i]["Phone"]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      teacherFoi(usn: "${list![i]["Teacher_id"]}"),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
