import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/syllabus%20screens/semester_syllabus_screen.dart';
import 'package:study_notes/utils/constants.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syllabus'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: syllabus1.length,
          itemBuilder: (BuildContext c, int i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: 30,
                  verticalOffset: 300.0,
                  child: FlipAnimation(
                    duration: const Duration(milliseconds: 3000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    flipAxis: FlipAxis.y,
                    child: Container(
                      margin: EdgeInsets.only(bottom: w / 20),
                      height: w / 5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SemesterSyllabus(
                                          pdfLocation: syllabus1[i].pdfLocation,
                                        ))));
                          },
                          title: Text(
                            syllabus1[i].title,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}

class SyllabusList {
  final String title;
  final String pdfLocation;

  SyllabusList({required this.pdfLocation, required this.title});
}

final List<SyllabusList> syllabus1 = [
  SyllabusList(pdfLocation: sem1, title: 'Semester I'),
  SyllabusList(pdfLocation: sem2, title: 'Semester II'),
  SyllabusList(pdfLocation: sem3, title: 'Semester III'),
  SyllabusList(pdfLocation: sem4, title: 'Semester IV'),
  SyllabusList(pdfLocation: sem1, title: 'Semester V'),
  SyllabusList(pdfLocation: sem2, title: 'Semester VI'),
  SyllabusList(pdfLocation: sem3, title: 'Semester VII'),
  SyllabusList(pdfLocation: sem4, title: 'Semester VIII'),
  SyllabusList(pdfLocation: fullsyllabus, title: 'Full Syllabus'),
];
