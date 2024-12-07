import 'package:flutter/material.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/models/project_model.dart';
import 'package:task/views/widgets/custom_title_with_description.dart';

class ProjectsListViewItem extends StatelessWidget {
  const ProjectsListViewItem({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Company name
            CustomTitleWithDescription(
                title: S.of(context).projectTitle,
                description: project.projectTitle ?? ''),
            verticalSpacing(5),
            // Jop title
            CustomTitleWithDescription(
                title: S.of(context).projectLink,
                description: project.projectLink ?? ''),
            verticalSpacing(5),
            // Jop description
            CustomTitleWithDescription(
                title: S.of(context).projectDescription,
                description: project.projectDescription ?? ''),
          ],
        ),
      ),
    );
  }
}
