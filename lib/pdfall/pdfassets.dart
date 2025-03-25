import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfassets extends StatelessWidget {
  const Pdfassets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF")),
      body: Center(child: SfPdfViewer.asset('assets/task.pdf')),
    );
  }
}
