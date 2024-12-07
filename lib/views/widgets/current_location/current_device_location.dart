import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/helper/helper_functions.dart';
import 'package:task/core/utils/spacing.dart';
import 'package:task/logic/location_cubit.dart';
import 'package:task/logic/location_state.dart';
import 'package:task/views/widgets/custom_step_title.dart';
import 'package:task/views/widgets/location_display.dart';

class CurrentDeviceLocation extends StatefulWidget {
  const CurrentDeviceLocation({super.key});

  @override
  State<CurrentDeviceLocation> createState() => _CurrentDeviceLocationState();
}

class _CurrentDeviceLocationState extends State<CurrentDeviceLocation> {
  @override
  void initState() {
    context.read<LocationCubit>().getCurrentDeviceLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listenWhen: (previous, current) =>
          previous.currentLocationErrorError !=
          current.currentLocationErrorError,
      buildWhen: (previous, current) =>
          previous.currentLocationLoading != current.currentLocationLoading ||
          previous.currentLocationErrorError !=
              current.currentLocationErrorError ||
          previous.currentLocation != current.currentLocation,
      listener: (context, state) {
        if (state.currentLocationErrorError.isEmpty) {
          showSnackBar(context, state.currentLocationErrorError);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const CustomStepTitle(
                title: 'Location From Device Location', stepNumber: 3),
            verticalSpacing(15),
            if (state.currentLocationLoading)
              Align(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/animations/loading.json',
                ),
              ),
            if (state.currentLocation != null) ...[
              LocationDisplay(location: state.currentLocation!),
            ]
          ],
        );
      },
    );
  }
}
