import 'package:flutter/material.dart';
import 'package:task/models/project_model.dart';
import 'package:task/views/widgets/projects/projects_list_view_item.dart';

class ProjectsListView extends StatelessWidget {
  const ProjectsListView({super.key, required this.projects});
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectsListViewItem(project: projects[index]);
      },
    );
  }
}
