import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/logic/location_cubit.dart';
import 'package:task/logic/location_state.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        var cubit = context.read<LocationCubit>();
        return cubit.currentIndex == 0
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  cubit.changeIndexBack();
                },
                icon: const Icon(Icons.arrow_back_ios));
      },
    );
  }
}
