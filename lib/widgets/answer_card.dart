import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final dynamic answer;
  final bool isTapped;
  final VoidCallback onTap;
  const AnswerCard({
    super.key,
    required this.answer,
    required this.isTapped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return answer is String
        ? SizedBox(
            height: 60,
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                color: isTapped
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(answer,
                      style: TextStyle(
                        color: isTapped
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 100,
            width: 100,
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                shadowColor: isTapped
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                elevation: isTapped ? 20 : 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: answer,
                ),
              ),
            ),
          );
  }
}
