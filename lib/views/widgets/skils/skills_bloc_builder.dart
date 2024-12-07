import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/custom_empty_widget.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/logic/pdf/pdf_generator_state.dart';
import 'package:task/views/widgets/skils/skills_list_view.dart';

class SkillsBlocBuilder extends StatelessWidget {
  const SkillsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfGeneratorCubit, PdfGeneratorState>(
      builder: (context, state) {
        if (state.skills.isNotEmpty) {
          return SliverToBoxAdapter(
              child: SkillsListView(skills: state.skills));
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.center,
                child: CustomEmptyWidget(text: S.of(context).emptySkills)),
          );
        }
      },
    );
  }
}
