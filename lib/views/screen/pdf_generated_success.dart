import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/services/pdf_service/pdf_generator_service.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/views/widgets/success/pdf_action.dart';

class PdfGeneratedSuccessScreen extends StatelessWidget {
  const PdfGeneratedSuccessScreen({super.key, required this.pdf});
  final File pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/animation/success.json'),
          Text(
            S.of(context).pdfGeneratedSuccessfully,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PdfAction(
                  icon: Icons.share,
                  title: S.of(context).share,
                  onTap: () async {
                    await PdfGeneratorService.sharePdf(
                      pdf,
                    );
                  }),
              horizontalSpacing(20),
              PdfAction(
                  icon: Icons.file_open,
                  title: S.of(context).open,
                  onTap: () async {
                    await PdfGeneratorService.openPdfInApp(pdf);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
