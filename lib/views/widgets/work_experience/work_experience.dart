import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/work_experience/work_experience_bloc_builder.dart';
import 'package:task/views/widgets/work_experience/work_experience_model_sheet.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomStepTitle(
              title: S.of(context).workExperience,
              stepNumber: 3,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => BlocProvider.value(
                          value: cubit,
                          child: const WorkExperienceModelSheet(),
                        ));
              },
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpacing(10),
          ),
          const WorkExperienceBlocBuilder(),
        ],
      ),
    );
  }
}
