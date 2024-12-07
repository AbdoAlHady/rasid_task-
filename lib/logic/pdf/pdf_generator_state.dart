import 'dart:io';

import 'package:task/models/project_model.dart';
import 'package:task/models/skills_model.dart';
import 'package:task/models/work_experience_model.dart';

import '../../models/personal_information_model.dart';

class PdfGeneratorState {
  final PersonalInformationModel? personalInformation;
  final List<WorkExperienceModel> workExperience;
  final List<SkillsModel> skills;
  final int color;
  final List<ProjectModel> projectsOrAchievements;

  PdfGeneratorState(
      {this.personalInformation,
      this.workExperience = const [],
      this.skills = const [],
      this.color = 0xffD2691E,
      this.projectsOrAchievements = const []});

  PdfGeneratorState copyWith({
    PersonalInformationModel? personalInformation,
    List<WorkExperienceModel>? workExperience,
    List<SkillsModel>? skills,
    String? lang,
    int? color,
    bool? isLoading,
    File? pdfFile,
    List<ProjectModel>? projectsOrAchievements,
  }) {
    return PdfGeneratorState(
      personalInformation: personalInformation ?? this.personalInformation,
      workExperience: workExperience ?? this.workExperience,
      skills: skills ?? this.skills,
      color: color ?? this.color,
      projectsOrAchievements:
          projectsOrAchievements ?? this.projectsOrAchievements,
    );
  }
}
