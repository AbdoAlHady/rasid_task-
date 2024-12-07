import 'package:flutter/material.dart';
import 'package:task/core/theme/app_text_styles.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/models/skills_model.dart';

class SkillsListView extends StatelessWidget {
  const SkillsListView({super.key, required this.skills});
  final List<SkillsModel> skills;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.horizontal,
          children: List.generate(
            skills.length,
            (index) {
              return Wrap(
                children: [
                  Text(
                    skills[index].skillName ?? '',
                    style: AppTextStyles.font14DarkBlueMeduim,
                  ),
                  horizontalSpacing(5),
                  index == skills.length - 1
                      ? const SizedBox.shrink()
                      : const Text(' || '),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
