import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/theme/app_text_styles.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/core/wigdets/app_text_button.dart';
import 'package:task/core/wigdets/app_text_from_field.dart';
import 'package:task/logic/location_cubit.dart';
import 'package:task/logic/location_state.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/location_display.dart';

import '../../../core/helper/helper_functions.dart';

class CoordinateLocation extends StatefulWidget {
  const CoordinateLocation({super.key});

  @override
  State<CoordinateLocation> createState() => _CoordinateLocationState();
}

class _CoordinateLocationState extends State<CoordinateLocation> {
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listenWhen: (previous, current) =>
          previous.coordinateError != current.coordinateError,
      listener: (context, state) {
        if (state.coordinateError.isNotEmpty) {
          showSnackBar(context, state.coordinateError);
        }
      },
      buildWhen: (previous, current) =>
          previous.coordinateLocation != current.coordinateLocation,
      builder: (context, state) {
        final cubit = context.read<LocationCubit>();
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomStepTitle(
                  title: 'Location From Coordinates', stepNumber: 2),
              verticalSpacing(15),
              AppTextFormField(
                controller: _latitudeController,
                hintText: 'Latitude',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\-?\d*\.?\d{0,7}')),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Latitude';
                  }
                  if (!isValidCoordinate(value)) {
                    return 'Please enter a valid coordinate';
                  }
                  return null;
                },
              ),
              verticalSpacing(10),
              AppTextFormField(
                controller: _longitudeController,
                hintText: 'Longitude',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\-?\d*\.?\d{0,7}')),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Longitude';
                  } else if (!isValidCoordinate(value)) {
                    return 'Please enter a valid coordinate';
                  }
                  return null;
                },
              ),
              if (state.coordinateLocation != null) ...[
                verticalSpacing(10),
                LocationDisplay(location: state.coordinateLocation!)
              ],
              verticalSpacing(20),
              state.coordinateLoading
                  ? Lottie.asset('assets/animations/loading.json')
                  : AppTextButton(
                      buttonText: 'Extract Location',
                      textStyle: AppTextStyles.font15WhiteMeduim,
                      onPressed: () async {
                        //52.2165157, 6.9437819
                        if (_formKey.currentState!.validate()) {
                          await cubit.locationPermission();
                          if (cubit.isLocationPermissionGranted) {
                            cubit.getCoordinateLocation(
                                latitude:
                                    double.parse(_latitudeController.text),
                                longitude:
                                    double.parse(_longitudeController.text));
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
