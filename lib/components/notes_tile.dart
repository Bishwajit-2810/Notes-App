import 'package:flutter/material.dart';
import 'package:notes_app/components/special_buttons2.dart';
import 'package:popover/popover.dart';

class NotesTile extends StatelessWidget {
  void Function()? onPressed1;
  void Function()? onPressed2;
  final String text;

  NotesTile(
      {super.key,
      required this.text,
      required this.onPressed1,
      required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(2),
        child: ListTile(
          title: Text(
            text,
            // maxLines: 1000,
          ),

          trailing: Builder(builder: (context) {
            return IconButton(
              onPressed: () => showPopover(
                backgroundColor: Theme.of(context).colorScheme.surface,
                height: 100,
                width: 100,
                context: context,
                bodyBuilder: (context) => SpecialButtons2(
                  onPressed1: onPressed1,
                  onPressed2: onPressed2,
                ),
              ),
              icon: const Icon(Icons.more_vert),
            );
          }),

          // trailing:
          //     SpecialButtons(onPressed1: onPressed1, onPressed2: onPressed2),
        ),
      ),
    );
  }
}
