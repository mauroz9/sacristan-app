import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/header_info.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/step_card.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/step_square.dart';

class PlaySequencePage extends StatefulWidget {
  const PlaySequencePage({super.key});

  @override
  State<PlaySequencePage> createState() => _PlaySequencePageState();
}

class _PlaySequencePageState extends State<PlaySequencePage> {

  late PageController _pageController;
  int _currentStep = 4;

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
            child: HeaderInfo(totalSteps: _images.length, currentStep: _currentStep + 1 , title: "Lavado de Manos",),
          )),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 470,
                child: StepCard(stepPosition: _currentStep + 1 ,imageId: _images[_currentStep], stepName: "Nombre paso",),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                    color: _currentStep == 0 ? const Color(0xFFFFFFFF) : const Color(0xFF1F3C8B),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFD1D5DC), 
                      width: 2
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: _currentStep == 0 ? null : () {
                      if (_currentStep > 0) {
                        _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.transparent), 
                      shadowColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(Icons.arrow_back_ios, 
                          color: _currentStep == 0 ? Color.fromARGB(255, 140, 156, 180) : Colors.white
                          , size: 18, fontWeight: FontWeight.bold,),
                          SizedBox(width: 5),
                          Text("Anterior", style: TextStyle(color: _currentStep == 0 ? Color.fromARGB(255, 140, 156, 180) : Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                    color: _currentStep == _images.length - 1 ? const Color(0xFFFFFFFF) : const Color(0xFF1F3C8B),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFD1D5DC), width: 2)
                  ),
                  child: ElevatedButton(
                    onPressed: _currentStep == _images.length - 1 ? null : () {
                      if (_currentStep < _images.length - 1) {
                        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.transparent), 
                      shadowColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text("Siguiente", style: TextStyle(color: _currentStep == _images.length - 1 ? Color.fromARGB(255, 140, 156, 180) : Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios,
                            color: _currentStep == _images.length - 1 ? Color.fromARGB(255, 140, 156, 180) : Colors.white,
                            size: 18, fontWeight: FontWeight.bold,)
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}