import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandbox/screens/teacher/teacherget.dart';

class teacherProject extends StatefulWidget {
  final String usn;

  const teacherProject({Key? key, required this.usn}) : super(key: key);
  @override
  State<teacherProject> createState() => _teacherProjectState();
}

class _teacherProjectState extends State<teacherProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(206, 0, 55, 1),
          title: Text(
            "Projects",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: FutureBuilder<List>(
            future: fetchDataprojt(widget.usn),
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
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 7),
        itemCount: widget.list!.length,
        itemBuilder: (context, i) {
          return ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: Color.fromRGBO(255, 237, 235, 1),
            title: Text(
              "${widget.list![i]["Project_name"]}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          );
        });
  }
}
