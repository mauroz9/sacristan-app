import 'package:flutter/material.dart';

class StepSquare extends StatelessWidget {
  const StepSquare(
    {
    super.key,
    required this.stepPosition,
    required this.imageId,
    this.opacity = 1.0,
    this.scale = 1.0,   
  });

  final int stepPosition;
  final String imageId;
  final double opacity;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: Container( 
          width: 90, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1F3C8B),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 50,
                child: Center( 
                  child: Text(
                    'Paso $stepPosition', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 10, 
                      fontWeight: FontWeight.bold, 
                    ), 
                  )
                ),
              ),
              Spacer(),
              Image.network("https://api.arasaac.org/v1/pictograms/$imageId", height: 50, width: 50, ), SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}