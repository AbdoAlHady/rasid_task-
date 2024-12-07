import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/views/widgets/custom_step_title.dart';

import '../../../generated/l10n.dart';
import '../../../logic/pdf/pdf_generator_cubit.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();
    return Form(
      key: context.read<PdfGeneratorCubit>().personalInformationFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepTitle(
              title: S.of(context).personalInformation,
              stepNumber: 2,
            ),
            verticalSpacing(20),
            AppTextFormField(
              hintText: S.of(context).jobTitle,
              controller: cubit.jobTitleController,
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
              hintText: S.of(context).name,
              controller: cubit.nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).validationName;
                }
                return null;
              },
              prefixIcon: const Icon(Icons.person),
            ),
            verticalSpacing(10),
            AppTextFormField(
              hintText: S.of(context).email,
              controller: cubit.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).validationEmail;
                }
                return null;
              },
              prefixIcon: const Icon(Icons.email),
            ),
            verticalSpacing(10),
            AppTextFormField(
              hintText: S.of(context).phone,
              controller: cubit.phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).validationPhone;
                }
                return null;
              },
              prefixIcon: const Icon(FontAwesomeIcons.phone),
            ),
            verticalSpacing(10),
            AppTextFormField(
              hintText: S.of(context).linkedIn,
              controller: cubit.linkedInController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).validationLinkedIn;
                }
                return null;
              },
              prefixIcon: const SizedBox(
                width: 10,
                height: 10,
                child: Icon(FontAwesomeIcons.linkedin),
              ),
            ),
            verticalSpacing(10),
            AppTextFormField(
              hintText: S.of(context).github,
              controller: cubit.githubController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).validationGithub;
                }
                return null;
              },
              prefixIcon: const Icon(FontAwesomeIcons.github),
            ),
          ],
        ),
      ),
    );
  }
}
