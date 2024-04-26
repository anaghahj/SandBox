import 'package:flutter/material.dart';

import 'package:sandbox/screens/student/stuadd.dart';
import 'package:sandbox/screens/teacher/teachadd.dart';

class StudentTeacherForm extends StatefulWidget {
  @override
  _StudentTeacherFormState createState() => _StudentTeacherFormState();
}

class _StudentTeacherFormState extends State<StudentTeacherForm> {
  bool isStudent = true;

  String name = '';
  String id = '';
  String department = '';
  String semester = '';
  String section = '';
  String cgpa = '';
  String courseName = '';
  String courseType = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String fieldOfInterestName = '';
  String fieldOfInterestExperience = '';
  String projectName = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isStudent = true;
                });
              },
              style: ElevatedButton.styleFrom(
                  primary:
                      isStudent ? Color.fromRGBO(206, 0, 55, 1) : Colors.white,
                  onPrimary: isStudent ? Colors.white : Colors.grey),
              child: Text('Student'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isStudent = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary:
                    !isStudent ? Color.fromRGBO(206, 0, 55, 1) : Colors.white,
                onPrimary: !isStudent ? Colors.white : Colors.grey,
              ),
              child: Text('Teacher'),
            ),
          ],
        ),
        SizedBox(height: 20),
        if (isStudent) ...[
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'USN',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                id = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Department',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                department = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Semester',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                semester = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                section = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'CGPA',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                cgpa = value;
              });
            },
          ),
          SizedBox(height: 10),
          Text('Course And Activities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                courseName = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Course Type',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                courseType = value;
              });
            },
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: '2024-03-23',
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: startDate,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != startDate) {
                      setState(() {
                        startDate = picked;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: endDate,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != endDate) {
                      setState(() {
                        endDate = picked;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Field of Interest',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                fieldOfInterestName = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                fieldOfInterestExperience = value;
              });
            },
          ),
          SizedBox(height: 10),
        ] else ...[
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Teacher ID',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                id = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Department',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                department = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                section = value;
              });
            },
          ),
          SizedBox(height: 20),
          Text('Field of Interest',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                fieldOfInterestName = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                fieldOfInterestExperience = value;
              });
            },
          ),
          SizedBox(height: 20),
          Text('Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            onChanged: (value) {
              setState(() {
                projectName = value;
              });
            },
          ),
          SizedBox(height: 10),
        ],
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 237, 235, 1),
          ),
          onPressed: () {
            if (isStudent) {
              addcaa(id, courseName, courseType, startDate.toString(),
                  endDate.toString());
              addstu(id, name, semester, section, department, cgpa);
              addfoi(id, fieldOfInterestName, fieldOfInterestExperience);
            } else {
              addproj(id, projectName);
              addteach(id, name, department, section);
              addfoit(id, fieldOfInterestName, fieldOfInterestExperience);
            }
            Navigator.pop(context);
          },
          child: Text('Submit'),
        ),
        Container(
          height: 200,
        )
      ],
    );
  }
}
