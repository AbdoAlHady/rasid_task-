import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/logic/location_cubit.dart';
import 'package:task/logic/location_state.dart';
import 'package:task/views/widgets/coordinates/coordinate_location.dart';
import 'package:task/views/widgets/current_location/current_device_location.dart';
import 'package:task/views/widgets/map_link/map_link.dart';

class LocationScreenBody extends StatelessWidget {
  const LocationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<LocationCubit>();
        return IndexedStack(
          index: cubit.currentIndex,
          children: const [
            MapLink(),
            CoordinateLocation(),
            CurrentDeviceLocation()
          ],
        );
      },
    );
  }
}
