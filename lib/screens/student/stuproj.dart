import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandbox/screens/student/studentget.dart';

class StudentProject extends StatefulWidget {
  final String usn;

  const StudentProject({Key? key, required this.usn}) : super(key: key);
  @override
  State<StudentProject> createState() => _StudentProjectState();
}

class _StudentProjectState extends State<StudentProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(206, 0, 55, 1),
          title: Text(
            "Course and Activities",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: fetchDataproj(widget.usn),
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
        ));
  }
}

class ItemList extends StatefulWidget {
  final List<dynamic>? list;

  ItemList({required this.list});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list!.length,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.list![i]["Type"]}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                "Name: ${widget.list![i]["Name"]}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Start Date: ${widget.list![i]["Date_start"]}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "End Date: ${widget.list![i]["Date_end"]}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
