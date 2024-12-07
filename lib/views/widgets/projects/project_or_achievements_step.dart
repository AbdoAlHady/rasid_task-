import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/projects/add_project_model_sheet.dart';
import 'package:task/views/widgets/projects/projects_bloc_builder.dart';

class ProjectOrAchievementsStep extends StatelessWidget {
  const ProjectOrAchievementsStep({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomStepTitle(
            title: S.of(context).projectsOrAchievement,
            stepNumber: 5,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: const AddProjectModelSheet(),
                      ));
            },
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpacing(10),
        ),
        const ProjectsBlocBuilder()
      ],
    );
  }
}
