import 'package:task/core/utils/cahche_helper.dart';
import 'package:task/models/project_model.dart';
import 'package:task/models/skills_model.dart';
import 'package:task/models/work_experience_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

abstract class PdfUi {
  // Work Experience
  static Widget workExperiences(List<WorkExperienceModel> works) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: works
            .map((work) => _workExperienceItem(work))
            .toList()
            .cast<Widget>());
  }

  static Widget _workExperienceItem(WorkExperienceModel workExperience) {
    String at = CacheHelper().getData(key: 'lang') == 'en' ? 'at' : 'في';
    String to = CacheHelper().getData(key: 'lang') == 'en' ? 'To' : 'إلى';
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: PdfColors.black,
              ),
            ),
            SizedBox(width: 5),
            Text(
              '${workExperience.jobTitle} $at ${workExperience.companyName} , ${workExperience.startDate} $to ${workExperience.endDate}',
              style: const TextStyle(fontSize: 15),
            ),
          ]),
          Paragraph(
              text: workExperience.jobDescription ?? '',
              style: const TextStyle(color: PdfColors.grey),
              margin: const EdgeInsets.only(left: 20)),
          SizedBox(height: 10),
        ]);
  }

  // Projects

  static Widget buildProjectItem(List<ProjectModel> projects) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: projects
            .map((project) => _projectItem(project))
            .toList()
            .cast<Widget>());
  }

  static Widget _projectItem(ProjectModel project) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      project.projectLink == null
          ? Text(project.projectTitle ?? '',
              style: const TextStyle(fontSize: 12))
          : _buildUrlLink(project.projectLink!, project.projectTitle!),
      SizedBox(height: 5),
      Paragraph(
          text: project.projectDescription ?? '',
          style: const TextStyle(color: PdfColors.grey),
          margin: const EdgeInsets.only(left: 20)),
      SizedBox(height: 10),
    ]);
  }

  static Widget _buildUrlLink(String url, String text) {
    return Link(
      destination: url,
      child: Text(text,
          style: const TextStyle(
            color: PdfColors.blue,
            decoration: TextDecoration.underline,
          )),
    );
  }

  // Skills
  static Widget skillsSection(List<SkillsModel> skills) {
    return Wrap(
        children: List.generate(
      skills.length,
      (index) {
        return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: PdfColors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(skills[index].skillName ?? ""),
              SizedBox(width: 5),
            ]);
      },
    ));
  }
}
