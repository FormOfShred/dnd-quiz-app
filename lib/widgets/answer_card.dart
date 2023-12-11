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
        ? TextAnswer(onTap: onTap, isTapped: isTapped, answer: answer)
        : ImageAnswer(onTap: onTap, isTapped: isTapped, answer: answer);
  }
}

class ImageAnswer extends StatelessWidget {
  const ImageAnswer({
    super.key,
    required this.onTap,
    required this.isTapped,
    required this.answer,
  });

  final VoidCallback onTap;
  final bool isTapped;
  final Image answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          /*shadowColor: isTapped
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,*/
          color: isTapped
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          elevation: isTapped ? 20 : 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: answer.image,
                    semanticLabel: answer.semanticLabel,
                  )),
              const SizedBox(width: 10),
              Text(answer.semanticLabel.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class TextAnswer extends StatelessWidget {
  const TextAnswer({
    super.key,
    required this.onTap,
    required this.isTapped,
    required this.answer,
  });

  final VoidCallback onTap;
  final bool isTapped;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: isTapped
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          elevation: 5,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: isTapped
                  ? BorderSide(color: Theme.of(context).colorScheme.primary)
                  : BorderSide(color: Theme.of(context).colorScheme.secondary)),
          child: Center(
            child: Text(answer,
                style: TextStyle(
                  color: isTapped
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }
}
