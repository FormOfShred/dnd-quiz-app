import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onTap;
  const SaveButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text("Save Character",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                )),
          ),
        ),
      ),
    );
  }
}
