import 'package:flutter/material.dart';
import 'package:task/core/utils/spacing.dart';

import '../../model/location_model.dart';

class LocationDisplay extends StatelessWidget {
  final LocationModel location;

  const LocationDisplay({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${location.name}',
                style: const TextStyle(fontSize: 16)),
            verticalSpacing(8),
            Text('Street: ${location.street}',
                style: const TextStyle(fontSize: 16)),
            verticalSpacing(8),
            Text('Country: ${location.country}',
                style: const TextStyle(fontSize: 16)),
            verticalSpacing(8),
            Text('Postal Code: ${location.postalCode}',
                style: const TextStyle(fontSize: 16)),
            verticalSpacing(8),
            Text('Location: ${location.locality}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
