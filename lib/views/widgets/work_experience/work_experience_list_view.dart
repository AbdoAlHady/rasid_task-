import 'package:flutter/material.dart';
import 'package:task/models/work_experience_model.dart';
import 'package:task/views/widgets/work_experience/work_experience_list_view_item.dart';

class WorkExperienceListView extends StatelessWidget {
  const WorkExperienceListView({super.key, required this.workExperiences});

  final List<WorkExperienceModel> workExperiences;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: workExperiences.length,
      itemBuilder: (context, index) {
        return WorkExperienceListViewItem(
          workExperience: workExperiences[index],
        );
      },
    );
  }
}
