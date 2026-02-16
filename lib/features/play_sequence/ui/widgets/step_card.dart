import 'package:flutter/material.dart';

class StepCard extends StatelessWidget {
  const StepCard({super.key, required this.imageId, required this.stepPosition, required this.stepName});

  final String imageId;
  final int stepPosition;
  final String stepName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F3C8B),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text("Paso $stepPosition", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image(
                    image: NetworkImage("https://api.arasaac.org/v1/pictograms/$imageId"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                stepName, 
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color(0xFF1F3C8B)),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}