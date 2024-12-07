import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/custom_empty_widget.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';
import 'package:task/views/widgets/projects/projects_list_view.dart';

import '../../../generated/l10n.dart';

class ProjectsBlocBuilder extends StatelessWidget {
  const ProjectsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfGeneratorCubit, PdfGeneratorState>(
      builder: (context, state) {
        if (state.projectsOrAchievements.isNotEmpty) {
          return ProjectsListView(projects: state.projectsOrAchievements);
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.center,
              child: CustomEmptyWidget(
                text: S.of(context).emptyProjects,
              ),
            ),
          );
        }
      },
    );
  }
}
