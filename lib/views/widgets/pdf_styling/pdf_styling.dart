import 'package:flutter/material.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/pdf_styling/pdf_choose_lang.dart';
import 'package:task/views/widgets/pdf_styling/choose_pdf_colors.dart';

import '../../../generated/l10n.dart';

class PdfStyling extends StatelessWidget {
  const PdfStyling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomStepTitle(
            title: S.of(context).optionsForStylingThePDF, stepNumber: 1),
        verticalSpacing(10),
        const PdfChooseLanguage(),
        verticalSpacing(10),
        // choose the pdf color
        const ChoosePdfColors()
      ],
    );
  }
}
