import 'package:task/models/personal_information_model.dart';
import 'package:task/models/project_model.dart';
import 'package:task/models/skills_model.dart';
import 'package:task/models/work_experience_model.dart';

class PdfGeneratorModel {
  PersonalInformationModel personalInformation;
  List<WorkExperienceModel> workExperience;
  List<SkillsModel> skills;
  List<ProjectModel> projects;
  final int color;

  PdfGeneratorModel({
    required this.personalInformation,
    required this.workExperience,
    required this.skills,
    required this.projects,
    required this.color,
  });
}
