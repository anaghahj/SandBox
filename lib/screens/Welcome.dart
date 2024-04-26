import 'package:flutter/material.dart';
import 'package:sandbox/screens/student/studentinfo.dart';
import 'package:sandbox/screens/teacher/teacherinfo.dart';
import 'package:sandbox/widgets/adddetails.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key});
  static const id = "welcome";

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<Widget> _tabs = [Student(), Teacher()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Text(
                        "Student",
                        style: TextStyle(fontSize: 20, color: Colors.red[50]),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        "Teacher",
                        style: TextStyle(fontSize: 20, color: Colors.red[50]),
                      ),
                    )
                  ]),
              title: Text(
                "SANDBOX",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: Image.asset(
                "assets/logo/logo_trial.png",
                fit: BoxFit.cover,
                scale: 7,
              ),
              backgroundColor: Color.fromRGBO(206, 0, 55, 1)),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(255, 237, 235, 1),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  enableDrag: true,
                  context: context,
                  builder: (_) => StudentTeacherForm());
            },
            child: Icon(Icons.add),
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: _tabs,
          )),
    );
  }
}
