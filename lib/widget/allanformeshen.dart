// ignore_for_file: public_member_api_docs
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets/font.dart';
import 'package:printing/printing.dart';


class Pri extends StatefulWidget {
  final String co1;
  final  String co2;
  final String co3;
  final   String co4;
  final   String co5;
  final String co6;
  final String co7;
  final String co8;
  final  String co9;
  final String co10;
  final String co11;
  final  String co12;
  final String co13;
  final  String co14;
  final  String co15;
  final String co16;
  final String co17;

  const Pri({Key key, this.co1, this.co2, this.co3, this.co4, this.co5, this.co6, this.co7, this.co8, this.co9, this.co10, this.co11, this.co12, this.co13, this.co14, this.co15, this.co16, this.co17}) : super(key: key);
  @override
  _PriState createState() => _PriState();
}

class _PriState extends State<Pri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("طباعه")),
        body: PdfPreview(
          build: (format) => _generatePdf(format,),
        ),
      );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format,) async {
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
        theme: myTheme,
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.max,
                children: [
                  pw.Text("احمد",
                    textDirection: pw.TextDirection.rtl,

                  ),
                  pw.Directionality(
                    textDirection: pw.TextDirection.rtl,
                    child: pw.Table.fromTextArray(

                      headerStyle: pw.TextStyle(
                          fontSize: 25
                      ),
                      headers: <dynamic>[ 'معلومات الطلب العقد', 'المعلومات المطلوبه'],
                      cellAlignment: pw.Alignment.center,
                      cellStyle: pw.TextStyle(
                        fontSize: 20,
                      ),
                      data:  <List<dynamic>>[
                        <dynamic>[ "اح", widget.co1 ],
                        <dynamic>[ "احمد", 'قميص' ],
                        <dynamic>[ 'كوي', 'قميص' ],
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 420),
                  pw.Container(
                    alignment: pw.Alignment.bottomCenter,
                    child: pw.Text("عہقہود ألكہتہرونہيہة",textDirection: pw.TextDirection.rtl,
                        style: pw.TextStyle(
                          fontSize: 30,
                        )
                    ),
                  )
                ]
            ),
          );
        },
      ),
    );
    return pdf.save();
  }
}