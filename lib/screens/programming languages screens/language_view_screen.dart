import 'package:flutter/material.dart';

class DisplayModel extends StatelessWidget {
  final String image;
  final String title1;
  final String details;
  const DisplayModel({
    super.key,
    required this.image,
    required this.title1,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(title1),
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SizedBox(
                  height: height * 0.30,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Colors.white38,
                child: Text(
                  details,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
