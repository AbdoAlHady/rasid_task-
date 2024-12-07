import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/widgets/app_text_button.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/models/project_model.dart';

class AddProjectModelSheet extends StatefulWidget {
  const AddProjectModelSheet({super.key});

  @override
  State<AddProjectModelSheet> createState() => _AddProjectModelSheetState();
}

class _AddProjectModelSheetState extends State<AddProjectModelSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _projectTitleController = TextEditingController();
  final TextEditingController _projectLinkController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(15),
              Text(
                S.of(context).addNewProjectOrAchievement,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              verticalSpacing(15),
              AppTextFormField(
                controller: _projectTitleController,
                hintText: S.of(context).projectTitle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationProjectTitle;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.info),
              ),
              verticalSpacing(10),
              AppTextFormField(
                hintText: S.of(context).projectLink,
                controller: _projectLinkController,
                validator: (value) {},
                prefixIcon: const Icon(Icons.link),
              ),
              verticalSpacing(10),
              AppTextFormField(
                hintText: S.of(context).projectDescription,
                controller: _projectDescriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationProjectDescription;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.description),
                maxLines: 2,
              ),
              verticalSpacing(20),
              AppTextButton(
                buttonText: S.of(context).add,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final projectModel = ProjectModel(
                      projectTitle: _projectTitleController.text,
                      projectLink: _projectLinkController.text,
                      projectDescription: _projectDescriptionController.text,
                    );
                    await context
                        .read<PdfGeneratorCubit>()
                        .addNewProject(project: projectModel);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                    _clearControllers();
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

  void _clearControllers() {
    _projectTitleController.clear();
    _projectLinkController.clear();
    _projectDescriptionController.clear();
  }
}
