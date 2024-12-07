import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:task/core/services/pdf_service/pdf_header_section.dart';
import 'package:task/core/services/pdf_service/pdf_ui.dart';

import '../../../models/pdf_generator_model.dart';

class PdfGeneratorService {
  PdfGeneratorService._();

  static late Font arFont;
  static late Font enFont;

  static Future<void> loadFont() async {
    arFont = Font.ttf(await rootBundle.load('assets/fonts/Cairo-Bold.ttf'));
    enFont = Font.ttf(await rootBundle.load('assets/fonts/Poppins-Bold.ttf'));
  }

  static Future<File> generate(
      {required PdfGeneratorModel pdfGeneratorModel,
      required String lang}) async {
    int color = pdfGeneratorModel.color;
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        textDirection: lang == 'en' ? TextDirection.ltr : TextDirection.rtl,
        theme: ThemeData.withFont(
          base: lang == 'en' ? enFont : arFont,
        ),
        build: (context) {
          return [
            PdfHeaderSection.buildHeaderSection(
                personalInformation: pdfGeneratorModel.personalInformation,
                lang: lang),
            SizedBox(height: 10),
            // Skills
            _buildCustomHeader(lang == 'en' ? 'Skills' : 'المهارات', color),

            PdfUi.skillsSection(pdfGeneratorModel.skills),
            SizedBox(height: 10),
            // Work Experience
            _buildCustomHeader(
                lang == 'en' ? 'Work Experience' : 'الخبرات العملية', color),
            PdfUi.workExperiences(pdfGeneratorModel.workExperience),

            // Projects
            _buildCustomHeader(lang == 'en' ? 'Projects' : 'المشاريع', color),

            PdfUi.buildProjectItem(pdfGeneratorModel.projects),
          ];
        },
        header: (context) {
          return Container();
        },
        footer: (context) {
          String page = lang == 'en' ? 'Page' : 'الصفحة';
          String of = lang == 'en' ? 'of' : 'من';

          final text = '$page ${context.pageNumber} $of ${context.pagesCount}';
          return Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.mm),
            child: Text(
              text,
              style: TextStyle(color: PdfColor.fromInt(color)),
            ),
          );
        },
      ),
    );

    return saveDocument(
        pdfName: '${pdfGeneratorModel.personalInformation.name}.pdf', pdf: pdf);
  }

  static Widget _buildCustomHeader(String text, int color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20, color: PdfColor.fromInt(color)),
        ),
        Divider(color: PdfColors.grey, thickness: 2, height: 0)
      ],
    );
  }

  static Future<File> saveDocument(
      {required String pdfName, required Document pdf}) async {
    // save the pdf and get the file bytes
    final bytes = await pdf.save();

    // Apllication directory
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$pdfName');
    await file.writeAsBytes(bytes);

    return file;
  }

  // Open the PDF file

  static Future openFile(File file) async {
    // file path
    final path = file.path;

    await OpenFile.open(path);
  }

  static Future<void> sharePdf(File pdfFile) async {
    await Share.shareXFiles(
      [XFile(pdfFile.path)],
      text: 'Check out my portfolio',
    );
  }

  static Future<void> openPdfInApp(File pdfFile) async {
    await Printing.layoutPdf(
      onLayout: (format) => pdfFile.readAsBytesSync(),
    );
  }
}
