import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/helper/helper_functions.dart';
import 'package:task/core/theme/app_text_styles.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/wigdets/app_text_button.dart';
import 'package:task/core/wigdets/app_text_from_field.dart';
import 'package:task/logic/location_state.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/location_display.dart';

import '../../../logic/location_cubit.dart';

class MapLink extends StatefulWidget {
  const MapLink({super.key});

  @override
  State<MapLink> createState() => _MapLinkState();
}

class _MapLinkState extends State<MapLink> {
  final TextEditingController _mapLinkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _mapLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listenWhen: (previous, current) => previous.mapError != current.mapError,
      listener: (context, state) {
        log('MapLink listener');
        if (state.mapError.isNotEmpty) {
          showSnackBar(context, state.mapError);
        }
      },
      buildWhen: (previous, current) =>
          previous.mapLocation != current.mapLocation ||
          previous.mapError != current.mapError,
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomStepTitle(
                  title: 'Location From Maps Link ', stepNumber: 1),
              verticalSpacing(15),
              AppTextFormField(
                controller: _mapLinkController,
                hintText: 'Google Map Link',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid map link';
                  }
                  return null;
                },
              ),
              if (state.mapLocation != null) ...[
                verticalSpacing(10),
                LocationDisplay(location: state.mapLocation!)
              ],
              verticalSpacing(20),
              state.mapLoading
                  ? Lottie.asset('assets/animations/loading.json')
                  : AppTextButton(
                      buttonText: 'Extract Location',
                      textStyle: AppTextStyles.font15WhiteMeduim,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await cubit.locationPermission();
                          if (cubit.isLocationPermissionGranted) {
                            cubit.getMapLinkAddress(_mapLinkController.text);
                          }
                        }
                      })
            ],
          ),
        );
      },
    );
  }
}
