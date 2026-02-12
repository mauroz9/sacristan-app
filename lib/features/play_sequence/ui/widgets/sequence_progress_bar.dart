import 'package:flutter/material.dart';

class SequenceProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const SequenceProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: 0,
        end: progress,
      ),
      builder: (context, value, _) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: const Color(0xFF4C63A2),
          valueColor: AlwaysStoppedAnimation<Color>(
            const Color(0xFFFFC107),
          ),
          minHeight: 15,
        ),
      ),
    );
  }
}