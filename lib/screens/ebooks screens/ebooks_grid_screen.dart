import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/ebooks%20screens/ebooks_view_screen.dart';
import 'package:study_notes/utils/constants.dart';

class EBooksGrid extends StatelessWidget {
  const EBooksGrid({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    List<SubList> sublist = [];
    if (title == 'Semester I') {
      sublist = [
        SubList(title: 'Communication Techniques', pdfLocations: sem1),
        SubList(title: 'Engg. Mathematics-I', pdfLocations: sem2),
        SubList(title: 'Engg. Physics-I', pdfLocations: sem3),
        SubList(title: 'Chemistry & Environmental Engg-I', pdfLocations: sem4),
        SubList(title: 'Engg. Mechanics', pdfLocations: sem1),
        SubList(title: 'Instrumentation Engg.', pdfLocations: sem2)
      ];
    } else if (title == 'Semester II') {
      sublist = [
        SubList(title: 'Communicative English', pdfLocations: sem1),
        SubList(title: 'Engg. Mathematics-II', pdfLocations: sem2),
        SubList(title: 'Engg. Physics-II', pdfLocations: sem3),
        SubList(title: 'Chemistry & Environmental Engg-II', pdfLocations: sem4),
        SubList(title: 'Computer System And Programming', pdfLocations: sem1),
        SubList(title: 'Electrical & Electronics Engg.', pdfLocations: sem2)
      ];
    } else if (title == 'Semester III') {
      sublist = [
        SubList(title: 'Digital Electronics', pdfLocations: sem1),
        SubList(title: 'Electronic Devices & Circuits', pdfLocations: sem2),
        SubList(title: 'Data Structure and Algorithms', pdfLocations: sem3),
        SubList(title: 'Discrete Mathematical Structures', pdfLocations: sem4),
        SubList(title: 'Mathematics III', pdfLocations: sem1),
        SubList(title: 'Management Information Systems', pdfLocations: sem2)
      ];
    } else if (title == 'Semester IV') {
      sublist = [
        SubList(
            title: 'Principles of Programming Languages', pdfLocations: sem1),
        SubList(title: 'Microprocessor and Interfaces', pdfLocations: sem2),
        SubList(title: 'Object Oriented Programming', pdfLocations: sem3),
        SubList(title: 'System Software', pdfLocations: sem4),
        SubList(title: 'Statistics and Probability Theory', pdfLocations: sem1),
        SubList(title: 'Analog & Digital Communication', pdfLocations: sem2)
      ];
    } else if (title == 'Semester V') {
      sublist = [
        SubList(title: 'Software Engineering', pdfLocations: sem1),
        SubList(title: 'Computer Architecture', pdfLocations: sem2),
        SubList(title: 'Database Management Systems', pdfLocations: sem3),
        SubList(title: 'Computer Graphics', pdfLocations: sem4),
        SubList(title: 'Telecommunication Fundamentals', pdfLocations: sem1),
        SubList(title: 'Advanced Data Structure', pdfLocations: sem2)
      ];
    } else if (title == 'Semester VI') {
      sublist = [
        SubList(title: 'Operating Systems', pdfLocations: sem1),
        SubList(title: 'Computer Networks', pdfLocations: sem2),
        SubList(title: 'Design & Analysis of Algorithms', pdfLocations: sem3),
        SubList(title: 'Embedded Systems', pdfLocations: sem4),
        SubList(title: 'Theory Of Computation', pdfLocations: sem1),
        SubList(title: 'Advanced Software Engineering', pdfLocations: sem2)
      ];
    } else if (title == 'Semester VII') {
      sublist = [
        SubList(title: 'Compiler Construction', pdfLocations: sem1),
        SubList(title: 'Data Mining And Ware Housing', pdfLocations: sem2),
        SubList(title: 'Introduction To Web Technology', pdfLocations: sem3),
        SubList(title: 'Artificial Intelligence', pdfLocations: sem4),
        SubList(title: 'Multimedia Systems', pdfLocations: sem1),
        SubList(title: 'Real Time Systems', pdfLocations: sem2)
      ];
    } else if (title == 'Semester VIII') {
      sublist = [
        SubList(title: 'Information System and Securities', pdfLocations: sem1),
        SubList(title: 'CAD FOR VLSI Design', pdfLocations: sem2),
        SubList(title: 'Advanced computer Architectures', pdfLocations: sem3),
        SubList(title: 'Distributed Systems', pdfLocations: sem4),
      ];
    }

    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AnimationLimiter(
            child: GridView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(w / 60),
                shrinkWrap: true,
                itemCount: sublist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: ((context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    duration: const Duration(milliseconds: 500),
                    position: index,
                    columnCount: sublist.length,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        child: EbooksGrid(
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => EBooksView(
                                          pdfLocations:
                                              sublist[index].pdfLocations,
                                        ))));
                          },
                          w: w,
                          sublist: sublist,
                          title: sublist[index].title,
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ),
      ),
    );
  }
}

class EbooksGrid extends StatelessWidget {
  const EbooksGrid({
    super.key,
    required this.w,
    required this.sublist,
    required this.title,
    required this.onPress,
  });

  final double w;
  final VoidCallback onPress;
  final List<SubList> sublist;
  final String title;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final color = Color.fromRGBO(
      random.nextInt(200),
      random.nextInt(200),
      random.nextInt(200),
      1,
    );

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(ebooks),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubList {
  final String title;
  final String pdfLocations;

  SubList({required this.title, required this.pdfLocations});
}
