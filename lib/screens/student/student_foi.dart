import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sandbox/screens/student/studentget.dart';

class STudentFoi extends StatefulWidget {
  final String usn;

  const STudentFoi({Key? key, required this.usn}) : super(key: key);

  @override
  State<STudentFoi> createState() => _STudentFoiState();
}

class _STudentFoiState extends State<STudentFoi> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchDatafoi(widget.usn),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ItemList(list: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List<dynamic> list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Field of Interest: ${list[i]["Foi"]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Experience: ${list[i]["Experience"]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
              ]);
        },
      ),
    );
  }
}
