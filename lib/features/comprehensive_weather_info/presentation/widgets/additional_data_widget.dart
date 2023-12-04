import 'package:flutter/material.dart';

class AdditionalDataWidget extends StatelessWidget {
  final double? figure;
  final String imagePath;
  final String name;

  const AdditionalDataWidget({
    super.key,
    required this.figure,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$figure'),
          Image.asset(
            imagePath,
            width: 50,
          ),
          Text(name),
        ],
      ),
    );
  }
}
