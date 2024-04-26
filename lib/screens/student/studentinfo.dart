import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sandbox/screens/student/studentget.dart';
import 'package:sandbox/screens/student/stuproj.dart';
import 'dart:convert';
import 'package:sandbox/screens/student/student_foi.dart';

class Student extends StatefulWidget {
  const Student({Key? key});
  static const id = "Student";

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
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

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  final List? list;
  var Usn = "";
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
                Usn = list![i]["Usn"];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentProject(usn: Usn)),
                );
              },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 225,
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
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list![i]["Name"]}, ${list![i]["Department"]}, ${list![i]["Semester"]}',
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
                            'Section: ${list![i]["Section"]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            'CGPA: ${list![i]["CGPA"]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      STudentFoi(usn: "${list![i]["Usn"]}"),
                      SizedBox(height: 10),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const StudentProject(
                      //                 usn: "${list![i]["Usn"]}")),
                      //       );
                      //     },
                      //     child: Text("View"),
                      //   ),
                      // ),
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
