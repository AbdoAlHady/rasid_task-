import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/custom_empty_widget.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';
import 'package:task/views/widgets/work_experience/work_experience_list_view.dart';

class WorkExperienceBlocBuilder extends StatelessWidget {
  const WorkExperienceBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfGeneratorCubit, PdfGeneratorState>(
      builder: (context, state) {
        return state.workExperience.isNotEmpty
            ? WorkExperienceListView(workExperiences: state.workExperience)
            : SliverFillRemaining(
                child: Align(
                    alignment: Alignment.center,
                    child: CustomEmptyWidget(
                        text: S.of(context).emptyWorkExperience)));
      },
    );
  }
}
