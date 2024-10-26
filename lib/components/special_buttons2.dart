import 'package:flutter/material.dart';

class SpecialButtons2 extends StatelessWidget {
  void Function()? onPressed1;
  void Function()? onPressed2;
  SpecialButtons2({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onPressed1!();
          },
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                "Edit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onPressed2!();
          },
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                "Delete",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
