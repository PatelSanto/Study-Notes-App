import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/handwritten_notes_screens/notes_view.dart';
import 'package:study_notes/utils/constants.dart';

class NotesLists extends StatelessWidget {
  const NotesLists({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    List<HandWrittenList> handwrittenlist = [];
    if (title == 'Communication Techniques') {
      handwrittenlist = [
        HandWrittenList(title: 'Communication Techniques', pdfLocations: sem1),
        HandWrittenList(title: 'Engg. Mathematics-I', pdfLocations: sem2),
        HandWrittenList(title: 'Engg. Physics-I', pdfLocations: sem3),
        HandWrittenList(
            title: 'Chemistry & Environmental Engg-I', pdfLocations: sem4),
        HandWrittenList(title: 'Engg. Mechanics', pdfLocations: sem1),
        HandWrittenList(title: 'Instrumentation Engg.', pdfLocations: sem2)
      ];
    } else if (title == 'Engg. Mathematics-I') {
    } else if (title == 'Engg. Physics-I') {
    } else if (title == 'Chemistry & Environmental Engg-I') {
    } else if (title == 'Engg. Mechanics') {
    } else if (title == 'Instrumentation Engg.') {
    } else if (title == 'Communicative English') {
    } else if (title == 'Engg. Mathematics-II') {
    } else if (title == 'Engg. Physics-II') {
    } else if (title == 'Chemistry & Environmental Engg-II') {
    } else if (title == 'Computer System & Programming') {
    } else if (title == 'Electrical & Electronics Engg.') {
    } else if (title == 'Digital Electronics') {
    } else if (title == 'Electronic Devices & Circuits') {
    } else if (title == 'Data Structure and Algorithms') {
    } else if (title == 'Discrete Mathematical Structures') {
    } else if (title == 'Mathematics III') {
    } else if (title == 'Management Information Systems') {
    } else if (title == 'Principles of Programming Languages') {
    } else if (title == 'Microprocessor and Interfaces') {
    } else if (title == 'System Software') {
    } else if (title == 'Statistics and Probability Theory') {
    } else if (title == 'Analog & Digital Communication') {
    } else if (title == 'Software Engineering') {
    } else if (title == 'Computer Architecture') {
    } else if (title == 'Database Management Systems') {
    } else if (title == 'Computer Graphics') {
    } else if (title == 'Telecommunication Fundamentals') {
    } else if (title == 'Advanced Data Structure') {
    } else if (title == 'Operating Systems') {
    } else if (title == 'Computer Networks') {
    } else if (title == 'Design & Analysis of Algorithms') {
    } else if (title == 'Embedded Systems') {
    } else if (title == 'Theory Of Computation') {
    } else if (title == 'Advanced Software Engineering') {
    } else if (title == 'Compiler Construction') {
    } else if (title == 'Data Mining And Ware Housing') {
    } else if (title == 'Introduction To Web Technology') {
    } else if (title == 'Artificial Intelligence') {
    } else if (title == 'Multimedia Systems') {
    } else if (title == 'Real Time Systems') {
    } else if (title == 'Information System and Securities') {
    } else if (title == 'CAD FOR VLSI Design') {
    } else if (title == 'Advanced computer Architectures') {
    } else if (title == 'Distributed Systems') {}

    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: AnimationLimiter(
          child: ListView.builder(
              padding: EdgeInsets.all(w / 30),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: handwrittenlist.length,
              itemBuilder: ((BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    verticalOffset: -250,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Container(
                        margin: EdgeInsets.only(bottom: w / 20),
                        height: w / 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => NotesView(
                                            pdfLocations: handwrittenlist[index]
                                                .pdfLocations,
                                          ))));
                            },
                            title: Text(
                              handwrittenlist[index].title,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}

class HandWrittenList {
  final String title;
  final String pdfLocations;

  HandWrittenList({required this.title, required this.pdfLocations});
}
