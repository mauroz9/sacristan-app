import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/header_info.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/step_square.dart';

class PlaySequencePage extends StatefulWidget {
  const PlaySequencePage({super.key});

  @override
  State<PlaySequencePage> createState() => _PlaySequencePageState();
}

class _PlaySequencePageState extends State<PlaySequencePage> {

  late PageController _pageController;
  int _currentStep = 0;

  final List<String> _images = ["8975", "8976", "8977", "8978", "8979"];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.4, // Adjust this to change spacing between steps
    )..addListener(() {
        setState(() {
          _currentStep = _pageController.page!.toInt();
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 205,
          decoration: BoxDecoration(
            color: const Color(0xFF1F3C8B),
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(
                width: 7,
                color: const Color.fromARGB(255, 240, 200, 56),
              ),
            ),
          ),
          child: SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 0),
            child: HeaderInfo(totalSteps: _images.length, currentStep: _currentStep, title: "Lavado de Manos",),
          )),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 470,
                color: Colors.black,
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 90,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    int relativePostion = index -_currentStep;
                    double scale = (1 - (relativePostion.abs() * 0.2)).clamp(0.8, 1.0);
                    double opacity = 1;

                    if (relativePostion < -0.5) {
                      opacity = 0.4;
                    } else if (relativePostion <= 0.5){
                      opacity = 1;
                    }

                    return Center(
                        child: StepSquare(
                          stepPosition: index + 1,
                          imageId: _images[index],
                          scale: scale,
                          opacity: opacity,
                        ),
                      );

                  },
                ),
              )
            ],
          ) 
        ),
        Container(
          color: Colors.white,
          height: 110,
        )
      ],
    );
  }
}