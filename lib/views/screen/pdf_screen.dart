import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/core/services/pdf_service/pdf_generator_service.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/utils/cahche_helper.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';
import 'package:task/models/pdf_generator_model.dart';
import 'package:task/views/screen/pdf_generated_success.dart';

import '../../generated/l10n.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();

    return BlocBuilder<PdfGeneratorCubit, PdfGeneratorState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              CacheHelper().getData(key: 'lang') == 'ar'
                  ? FloatingActionButtonLocation.startFloat
                  : FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              S.of(context).createYourPdf,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: cubit.currentIndex != 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      cubit.previousStep();
                    },
                  )
                : null,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.steps,
            ),
          ),
          floatingActionButton: cubit.currentIndex == 4
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  onPressed: () {
                    cubit.nextStep();
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(FontAwesomeIcons.arrowRight,
                      color: Colors.white),
                ),
          bottomSheet: cubit.currentIndex == 4 &&
                  state.projectsOrAchievements.isNotEmpty
              ? Container(
                  height: 50.h,
                  width: double.infinity,
                  color: AppColors.primary,
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        try {
                          final pdfModel = PdfGeneratorModel(
                              personalInformation: state.personalInformation!,
                              workExperience: state.workExperience,
                              skills: state.skills,
                              projects: state.projectsOrAchievements,
                              color: state.color);
                          final pdf = await PdfGeneratorService.generate(
                              pdfGeneratorModel: pdfModel,
                              lang: CacheHelper().getData(key: 'lang') ?? 'en');

                          if (context.mounted) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PdfGeneratedSuccessScreen(pdf: pdf);
                            }));
                          }
                        } catch (e) {
                          log('Faild to generate pdf : $e');
                        }
                      },
                      child: const Text(
                        "Generate PDF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
