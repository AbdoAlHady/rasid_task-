import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app/app_cubit/app_cubit.dart';
import 'package:task/core/app/app_cubit/app_state.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/widgets/custom_dropdown.dart';

import '../../../generated/l10n.dart';

class PdfChooseLanguage extends StatelessWidget {
  const PdfChooseLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).chooseYourPdfLanguage,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalSpacing(10),

        // choose the pdf language
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = context.read<AppCubit>();
            return CustomDropDown(
              items: cubit.langs,
              hintText: state.lang,
              onChanged: (value) {
                if (value == 'English') {
                  cubit.changeLanguage('en');
                } else {
                  cubit.changeLanguage('ar');
                }
              },
              value: state.lang,
            );
          },
        ),
      ],
    );
  }
}
