import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/sequence_progress_bar.dart';

class HeaderInfo extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final String title;

  const HeaderInfo({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.title = "Lavado de Manos",
  });

  @override
  Widget build(BuildContext context) {
    final bool hasValidTotalSteps = totalSteps > 0;
    final int percentage = hasValidTotalSteps
        ? ((currentStep / totalSteps) * 100).round()
        : 0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0, 0, 0),
                  child: IconButton.filled(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(78, 10, 10, 10),
                      ),
                    ),
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Paso $currentStep de $totalSteps",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SequenceProgressBar(totalSteps: totalSteps, currentStep: currentStep)
        ],
      ),
    );
  }
}
