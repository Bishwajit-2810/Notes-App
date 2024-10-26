import 'package:flutter/material.dart';

class SpecialButtons extends StatelessWidget {
  void Function()? onPressed1;
  void Function()? onPressed2;
  SpecialButtons(
      {super.key, required this.onPressed1, required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed1,
          child: const Icon(
            Icons.edit,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: onPressed2,
          child: const Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }
}
