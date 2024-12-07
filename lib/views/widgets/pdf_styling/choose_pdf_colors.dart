import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';

import '../../../generated/l10n.dart';

class ChoosePdfColors extends StatelessWidget {
  const ChoosePdfColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).chooseYourPdfColor,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalSpacing(8),
        BlocBuilder<PdfGeneratorCubit, PdfGeneratorState>(
          builder: (context, state) {
            return SizedBox(
              height: 40.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<PdfGeneratorCubit>().changeColor(index);
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(context
                            .read<PdfGeneratorCubit>()
                            .getColorByIndex(index)),
                        child: context.read<PdfGeneratorCubit>().colorIndex ==
                                index
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => horizontalSpacing(8),
                  itemCount: 6),
            );
          },
        )
      ],
    );
  }
}
