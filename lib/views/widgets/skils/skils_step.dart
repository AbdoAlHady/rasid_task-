import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/skils/add_skils_model_sheet.dart';
import 'package:task/views/widgets/skils/skills_bloc_builder.dart';

class SkilsStep extends StatelessWidget {
  const SkilsStep({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PdfGeneratorCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomStepTitle(
            title: S.of(context).skills,
            stepNumber: 4,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return BlocProvider.value(
                      value: cubit,
                      child: const AddSkillsModelSheet(),
                    );
                  });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpacing(10),
        ),
        // Add SkillsBlocBuilder here
        const SkillsBlocBuilder()
      ],
    );
  }
}
