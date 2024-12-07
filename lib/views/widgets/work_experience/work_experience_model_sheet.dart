import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/widgets/app_text_button.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/models/work_experience_model.dart';

class WorkExperienceModelSheet extends StatefulWidget {
  const WorkExperienceModelSheet({super.key});

  @override
  State<WorkExperienceModelSheet> createState() =>
      _WorkExperienceModelSheetState();
}

class _WorkExperienceModelSheetState extends State<WorkExperienceModelSheet> {
  final formKey = GlobalKey<FormState>();
  final jobTitleController = TextEditingController();
  final companyController = TextEditingController();
  final startDataController = TextEditingController();
  final endDateController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();
    return Container(
      padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(15),
              Text(
                S.of(context).addNewWorkExperience,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              verticalSpacing(15),
              AppTextFormField(
                hintText: S.of(context).jobTitle,
                controller: jobTitleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationJobTitle;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.work),
              ),
              verticalSpacing(10),
              AppTextFormField(
                hintText: S.of(context).companyName,
                controller: companyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationCompanyName;
                  }
                  return null;
                },
                prefixIcon: const Icon(FontAwesomeIcons.building),
              ),
              verticalSpacing(10),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: S.of(context).startDate,
                      controller: startDataController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).validationStartDate;
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.date_range),
                    ),
                  ),
                  horizontalSpacing(10),
                  Expanded(
                    child: AppTextFormField(
                      hintText: S.of(context).endDate,
                      controller: endDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).validationEndDate;
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.date_range),
                    ),
                  ),
                ],
              ),
              verticalSpacing(10),
              AppTextFormField(
                hintText: S.of(context).jobDescription,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationJobDescription;
                  }
                  return null;
                },
                controller: jobDescriptionController,
                maxLines: 4,
                prefixIcon: const Icon(Icons.description),
              ),
              verticalSpacing(20),

              // Add Button

              AppTextButton(
                buttonText: S.of(context).add,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await cubit.addNewworkExperience(WorkExperienceModel(
                      jobTitle: jobTitleController.text,
                      companyName: companyController.text,
                      startDate: startDataController.text,
                      endDate: endDateController.text,
                      jobDescription: jobDescriptionController.text,
                    ));
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
              ),

              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }
}
