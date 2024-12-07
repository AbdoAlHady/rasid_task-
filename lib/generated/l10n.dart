// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create Your CV`
  String get createYourPdf {
    return Intl.message(
      'Create Your CV',
      name: 'createYourPdf',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `LinkedIn`
  String get linkedIn {
    return Intl.message(
      'LinkedIn',
      name: 'linkedIn',
      desc: '',
      args: [],
    );
  }

  /// `Github`
  String get github {
    return Intl.message(
      'Github',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `Work Experience`
  String get workExperience {
    return Intl.message(
      'Work Experience',
      name: 'workExperience',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get jobTitle {
    return Intl.message(
      'Job Title',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Projects or Achievements`
  String get projectsOrAchievements {
    return Intl.message(
      'Projects or Achievements',
      name: 'projectsOrAchievements',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get jobDescription {
    return Intl.message(
      'Job Description',
      name: 'jobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add New Project or Achievement`
  String get addNewProjectOrAchievement {
    return Intl.message(
      'Add New Project or Achievement',
      name: 'addNewProjectOrAchievement',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `PDF generated successfully.!`
  String get pdfGeneratedSuccessfully {
    return Intl.message(
      'PDF generated successfully.!',
      name: 'pdfGeneratedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your PDF Language`
  String get chooseYourPdfLanguage {
    return Intl.message(
      'Choose Your PDF Language',
      name: 'chooseYourPdfLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add New Skill`
  String get addNewSkill {
    return Intl.message(
      'Add New Skill',
      name: 'addNewSkill',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Skill Name`
  String get skillName {
    return Intl.message(
      'Skill Name',
      name: 'skillName',
      desc: '',
      args: [],
    );
  }

  /// `Projects or Achievements`
  String get projectsOrAchievement {
    return Intl.message(
      'Projects or Achievements',
      name: 'projectsOrAchievement',
      desc: '',
      args: [],
    );
  }

  /// `Project Title`
  String get projectTitle {
    return Intl.message(
      'Project Title',
      name: 'projectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Project Description`
  String get projectDescription {
    return Intl.message(
      'Project Description',
      name: 'projectDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your PDF Color`
  String get chooseYourPdfColor {
    return Intl.message(
      'Choose Your PDF Color',
      name: 'chooseYourPdfColor',
      desc: '',
      args: [],
    );
  }

  /// `Options for styling the PDF`
  String get optionsForStylingThePDF {
    return Intl.message(
      'Options for styling the PDF',
      name: 'optionsForStylingThePDF',
      desc: '',
      args: [],
    );
  }

  /// `Add New Work Experience`
  String get addNewWorkExperience {
    return Intl.message(
      'Add New Work Experience',
      name: 'addNewWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Project Link (optional)`
  String get projectLink {
    return Intl.message(
      'Project Link (optional)',
      name: 'projectLink',
      desc: '',
      args: [],
    );
  }

  /// `Highlighting your projects can make your portfolio stand out. Don't miss the opportunity to showcase your amazing work!`
  String get emptyProjects {
    return Intl.message(
      'Highlighting your projects can make your portfolio stand out. Don\'t miss the opportunity to showcase your amazing work!',
      name: 'emptyProjects',
      desc: '',
      args: [],
    );
  }

  /// `Adding work experience can significantly enhance your portfolio. Don't miss out on showcasing your professional journey!`
  String get emptyWorkExperience {
    return Intl.message(
      'Adding work experience can significantly enhance your portfolio. Don\'t miss out on showcasing your professional journey!',
      name: 'emptyWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Listing your skills can significantly improve your portfolio. Make sure to highlight what you excel at!`
  String get emptySkills {
    return Intl.message(
      'Listing your skills can significantly improve your portfolio. Make sure to highlight what you excel at!',
      name: 'emptySkills',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get validationName {
    return Intl.message(
      'Please enter your name',
      name: 'validationName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validationEmail {
    return Intl.message(
      'Please enter your email',
      name: 'validationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get validationPhone {
    return Intl.message(
      'Please enter your phone number',
      name: 'validationPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your LinkedIn`
  String get validationLinkedIn {
    return Intl.message(
      'Please enter your LinkedIn',
      name: 'validationLinkedIn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your GitHub`
  String get validationGithub {
    return Intl.message(
      'Please enter your GitHub',
      name: 'validationGithub',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your job title`
  String get validationJobTitle {
    return Intl.message(
      'Please enter your job title',
      name: 'validationJobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your company name`
  String get validationCompanyName {
    return Intl.message(
      'Please enter your company name',
      name: 'validationCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your start date`
  String get validationStartDate {
    return Intl.message(
      'Please enter your start date',
      name: 'validationStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your end date`
  String get validationEndDate {
    return Intl.message(
      'Please enter your end date',
      name: 'validationEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your job description`
  String get validationJobDescription {
    return Intl.message(
      'Please enter your job description',
      name: 'validationJobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your skill name`
  String get validationSkillName {
    return Intl.message(
      'Please enter your skill name',
      name: 'validationSkillName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your project title`
  String get validationProjectTitle {
    return Intl.message(
      'Please enter your project title',
      name: 'validationProjectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your project description`
  String get validationProjectDescription {
    return Intl.message(
      'Please enter your project description',
      name: 'validationProjectDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
