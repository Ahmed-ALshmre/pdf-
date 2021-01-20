// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets/font.dart';
import 'package:printing/printing.dart';

void main() => runApp(const MyApp('Printing Demo'));

class MyApp extends StatelessWidget {
  const MyApp(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    var data = await rootBundle.load("assets/font/Janna LT Bold.ttf");
    var myTheme = pw.Theme.withFont(
      base: Font.ttf(await rootBundle.load("assets/font/Janna LT Bold.ttf")),

    );

    var myFont = Font.ttf(data);
    var myStyle = pw.TextStyle(font: myFont,fontSize: 100);
    final pdf = pw.Document(
        theme: myTheme
    );
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Text("احمد احسان عيال",
              textDirection: pw.TextDirection.rtl,

            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}