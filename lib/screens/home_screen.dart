import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_notes/screens/ebooks%20screens/ebooks_screen.dart';
import 'package:study_notes/screens/handwritten_notes_screens/notes_grid.dart';
import 'package:study_notes/screens/programming%20languages%20screens/language_screen.dart';
import 'package:study_notes/screens/syllabus%20screens/syllabus_screen.dart';

import '../utils/constants.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    setState(() {
      if (hour < 12) {
        _greeting = 'Good Morning';
      } else if (hour < 17) {
        _greeting = 'Good Afternoon';
      } else {
        _greeting = 'Good Evening';
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Study App'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (_bool == true) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            _bool = false;
          },
          icon: const Icon(Icons.menu_rounded),
          splashColor: Colors.transparent,
        ),
        actions: const [Icon(Icons.info_outlined)],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.30,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //   'Hi There!',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: false,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          FadeAnimatedText('Hi There!'),
                          FadeAnimatedText(_greeting),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardWidget(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SyllabusScreen())));
                    },
                    color: Colors.purple,
                    title: 'Syllabus',
                    image: syllabus,
                  ),
                  CardWidget(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const EBooksScreen())));
                    },
                    color: Colors.brown,
                    title: 'E-Books',
                    image: syllabus,
                  ),
                  CardWidget(
                    onPress: () {},
                    title: 'Quiz',
                    image: syllabus,
                    color: Colors.pink,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardWidget(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LanguagesScreen())));
                    },
                    title: 'Programming Languages',
                    image: syllabus,
                    color: Colors.green,
                  ),
                  CardWidget(
                    onPress: () {
                      // Fluttertoast.showToast(msg: 'Coming Soon...');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const HandWrittenNotesScreen())));
                    },
                    title: 'HandWritten Notes',
                    image: syllabus,
                    color: Colors.indigo,
                  ),
                  CardWidget(
                    onPress: () {},
                    title: 'Syllabus',
                    image: syllabus,
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardWidget(
                    onPress: () {},
                    title: 'Syllabus',
                    image: syllabus,
                    color: Colors.blue,
                  ),
                  CardWidget(
                    onPress: () {},
                    title: 'Syllabus',
                    image: syllabus,
                    color: Colors.deepPurpleAccent,
                  ),
                  CardWidget(
                    onPress: () {},
                    title: 'Syllabus',
                    image: syllabus,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: customNavBar(),
          ),
        ],
      ),
    );
  }

  Widget customNavBar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.50;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: _animation1.value,
        sigmaX: _animation1.value,
      ),
      child: Container(
        height: _bool ? 0 : height,
        width: _bool ? 0 : width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              height: height * 1.3,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 40,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      MyTile(
                          title: 'Settings',
                          icon: Icons.settings_outlined,
                          onPress: () {
                            HapticFeedback.lightImpact();
                          }),
                      MyTile(
                          title: 'About',
                          icon: Icons.info_outline_rounded,
                          onPress: () {
                            HapticFeedback.lightImpact();
                          }),
                      MyTile(
                          title: 'Feedback',
                          icon: Icons.feedback_outlined,
                          onPress: () {
                            HapticFeedback.lightImpact();
                          }),
                      MyTile(
                          title: 'Privacy Policy',
                          icon: Icons.find_in_page_outlined,
                          onPress: () {
                            HapticFeedback.lightImpact();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  const MyTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(0.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: onPress,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          trailing: const Icon(Icons.arrow_right, color: Colors.white),
        ),
        //  const SizedBox(
        //     height: 5,
        //     child: Divider(
        //       thickness: 2,
        //     ),
        //   ),
      ],
    );
  }
}
