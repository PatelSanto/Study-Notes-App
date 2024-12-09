import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EBooksView extends StatelessWidget {
  const EBooksView({super.key, required this.pdfLocations});
  final String? pdfLocations;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset(
          pdfLocations!,
          pageSpacing: 5,
          //  key: ValueKey(pdfLocations),
        ),
      ),
    );
  }
}
