import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/widgets/app_text_button.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';

class AddSkillsModelSheet extends StatelessWidget {
  const AddSkillsModelSheet({super.key});

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
        key: cubit.skillsFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(15),
              Text(
                S.of(context).addNewSkill,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              verticalSpacing(15),
              AppTextFormField(
                hintText: S.of(context).skillName,
                controller: cubit.skillsNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).validationSkillName;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.info),
              ),
              verticalSpacing(20),
              AppTextButton(
                buttonText: S.of(context).name,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (cubit.skillsFormKey.currentState!.validate()) {
                    await cubit.addNewSkils();
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
