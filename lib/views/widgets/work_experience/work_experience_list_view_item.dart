import 'package:flutter/material.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/models/work_experience_model.dart';
import 'package:task/views/widgets/custom_title_with_description.dart';

class WorkExperienceListViewItem extends StatelessWidget {
  const WorkExperienceListViewItem({super.key, required this.workExperience});
  final WorkExperienceModel workExperience;

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
                title: S.of(context).companyName,
                description: workExperience.companyName ?? ''),
            verticalSpacing(5),
            // Jop title
            CustomTitleWithDescription(
                title: S.of(context).jobTitle,
                description: workExperience.jobTitle ?? ''),
            verticalSpacing(5),
            // Jop description
            CustomTitleWithDescription(
                title: S.of(context).jobDescription,
                description: workExperience.jobDescription ?? ''),
            verticalSpacing(5),
            // Start date
            CustomTitleWithDescription(
                title: S.of(context).startDate,
                description: workExperience.startDate ?? ''),

            verticalSpacing(5),
            // End date
            CustomTitleWithDescription(
                title: S.of(context).endDate,
                description: workExperience.endDate ?? ''),
          ],
        ),
      ),
    );
  }
}
