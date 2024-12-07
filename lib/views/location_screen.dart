import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_text_styles.dart';
import 'package:task/core/utils/app_string.dart';
import 'package:task/logic/location_cubit.dart';
import 'package:task/logic/location_state.dart';
import 'package:task/views/widgets/back_icon.dart';
import 'package:task/views/widgets/location_screen_body.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..locationPermission(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: const BackIcon(),
          title: Text(
            AppString.locationFinder,
            style: AppTextStyles.font20Bold,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: const LocationScreenBody(),
              ),
            ),
          ],
        ),
        floatingActionButton: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            var cubit = context.read<LocationCubit>();
            return cubit.currentIndex < 2
                ? FloatingActionButton(
                    onPressed: () {
                      context.read<LocationCubit>().changeIndex();
                    },
                    backgroundColor: AppColors.primary,
                    child: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
