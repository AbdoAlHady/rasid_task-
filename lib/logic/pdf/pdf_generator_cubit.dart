import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';
import 'package:task/models/personal_information_model.dart';
import 'package:task/models/project_model.dart';
import 'package:task/models/skills_model.dart';
import 'package:task/views/widgets/pdf_styling/pdf_styling.dart';
import 'package:task/views/widgets/personal_information/personal_information.dart';
import 'package:task/views/widgets/projects/project_or_achievements_step.dart';
import 'package:task/views/widgets/skils/skils_step.dart';
import 'package:task/views/widgets/work_experience/work_experience.dart';

import '../../models/work_experience_model.dart';

class PdfGeneratorCubit extends Cubit<PdfGeneratorState> {
  PdfGeneratorCubit() : super(PdfGeneratorState());

  List<Widget> steps = [
    const PdfStyling(),
    const PersonalInformation(),
    const WorkExperience(),
    const SkilsStep(),
    const ProjectOrAchievementsStep(),
  ];
  // Personal Information
  final personalInformationFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final linkedInController = TextEditingController();
  final githubController = TextEditingController();
  final jobTitleController = TextEditingController();

  // Skills
  final skillsNameController = TextEditingController();
  final skillsFormKey = GlobalKey<FormState>();

  int currentIndex = 0;
  int colorIndex = 0;

  void changeColor(int index) {
    colorIndex = index;
    emit(state.copyWith(
      color: getColorByIndex(index),
    ));
  }

  int getColorByIndex(int index) {
    switch (index) {
      case 0:
        return 0xffD2691E;
      case 1:
        return 0xff000000;
      case 2:
        return 0xffFF0000;
      case 3:
        return 0xff00FF00;
      case 4:
        return 0xff0000FF;
      case 5:
        return 0xffFF00FF;
      default:
        return 0xffffffff;
    }
  }

  void changeLang(String lang) {
    emit(state.copyWith(
      lang: lang,
    ));
  }

  void changeIndex(int index, [File? pdfFile]) {
    currentIndex = index;
    emit(state.copyWith(pdfFile: pdfFile));
  }

  void previousStep() {
    currentIndex--;
    emit(state.copyWith());
  }

  Future<void> nextStep() async {
    if (currentIndex == 0) {
      currentIndex++;
      emit(state.copyWith());
    } else if (currentIndex == 1) {
      _personalInformation();
    } else if (currentIndex == 2) {
      _workExperience();
    } else if (currentIndex == 3) {
      _skils();
    }
    if (currentIndex == 4) {
      _projectsOrAchievements();
    }
  }

  void _personalInformation() {
    if (personalInformationFormKey.currentState!.validate()) {
      var personalInformation = PersonalInformationModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        linkedIn: linkedInController.text,
        github: githubController.text,
        jopTitle: jobTitleController.text,
      );
      currentIndex++;
      emit(state.copyWith(personalInformation: personalInformation));
    }
  }

  Future<void> addNewSkils() async {
    var skils = SkillsModel(
      skillName: skillsNameController.text,
    );
    _clearControllers();
    emit(state.copyWith(skills: [...state.skills, skils]));
  }

  Future<void> addNewProject({required ProjectModel project}) async {
    emit(state.copyWith(
        projectsOrAchievements: [...state.projectsOrAchievements, project]));
  }

  Future<void> addNewworkExperience(
      WorkExperienceModel workExperienceModel) async {
    emit(state.copyWith(
        workExperience: [...state.workExperience, workExperienceModel]));
    log(state.workExperience.length.toString());
  }

  void _clearControllers() {
    skillsNameController.clear();
  }

  void _workExperience() {
    if (state.workExperience.isNotEmpty) {
      currentIndex++;
      emit(state.copyWith());
    }
  }

  void _skils() {
    if (state.skills.isNotEmpty) {
      currentIndex++;
      emit(state.copyWith());
    }
  }

  void _projectsOrAchievements() {
    if (state.projectsOrAchievements.isNotEmpty) {
      currentIndex++;
      emit(state.copyWith());
    }
  }
}
