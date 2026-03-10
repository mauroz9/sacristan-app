import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/features/play_sequence/bloc/play_sequence_bloc.dart';
import 'package:pantalla_login_ui/features/play_sequence/bloc/play_sequence_event.dart';
import 'package:pantalla_login_ui/features/play_sequence/bloc/play_sequence_state.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/header_info.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/step_card.dart';
import 'package:pantalla_login_ui/features/play_sequence/ui/widgets/step_square.dart';
import 'package:pantalla_login_ui/pages/main_view.dart';

class PlaySequencePage extends StatefulWidget {
  const PlaySequencePage({super.key});

  @override
  State<PlaySequencePage> createState() => _PlaySequencePageState();
}

class _PlaySequencePageState extends State<PlaySequencePage> {
  late PageController _pageController;
  int _currentStep = 0;
  int? _reproductionId;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.4)
      ..addListener(() {
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
    return BlocListener<PlaySequenceBloc, PlaySequenceState>(
      listener: (context, state) {
        if (state is PlaySequenceStarted) {
          _reproductionId = state.reproductionId;
        }

        if (state is PlaySequenceLoaded && state.reproductionId != null) {
          _reproductionId = state.reproductionId;
        } else if (state is PlaySequenceCompleted) {
          

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainView()),
            );
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Secuencia completada!'), backgroundColor: Color.fromRGBO(31, 60, 139, 1.0)),
          );
          Navigator.pop(context);
        } else if (state is PlaySequenceCompletionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}'), backgroundColor: Color.fromRGBO(31, 60, 139, 1.0)),
          );
        } else if (state is PlayLibraryCompleted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainView(initialIndex: 1,)),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Secuencia de biblioteca completada!'), backgroundColor: Color.fromRGBO(31, 60, 139, 1.0)),
          );
        }
      },
      child: BlocBuilder<PlaySequenceBloc, PlaySequenceState>(
        builder: (context, state) {
          if (state is PlaySequenceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlaySequenceError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            );
          } else if (state is PlaySequenceLoaded) {
          final sequence = state.sequence;
          final steps = sequence.steps;
          // Update reproductionId if it's now available
          if (state.reproductionId != null) {
            _reproductionId = state.reproductionId;
          }

          if (steps.isEmpty) {
            return const Center(child: Text("Esta secuencia no tiene pasos"));
          }

          return Column(
            spacing: 10,
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
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 15,
                      left: 15,
                      bottom: 0,
                    ),
                    child: HeaderInfo(
                      totalSteps: steps.length,
                      currentStep: _currentStep + 1,
                      title: sequence.title,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: StepCard(
                        stepPosition: _currentStep + 1,
                        imageId: steps[_currentStep].arasaacPictogramId
                            .toString(),
                        stepName: steps[_currentStep].name,
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        itemCount: steps.length,
                        itemBuilder: (context, index) {
                          int relativePostion = index - _currentStep;
                          double scale = (1 - (relativePostion.abs() * 0.2))
                              .clamp(0.8, 1.0);
                          double opacity = 1;

                          if (relativePostion < -0.5) {
                            opacity = 0.4;
                          } else if (relativePostion <= 0.5) {
                            opacity = 1;
                          }

                          return Center(
                            child: StepSquare(
                              stepPosition: index + 1,
                              imageId: steps[index].arasaacPictogramId
                                  .toString(),
                              scale: scale,
                              opacity: opacity,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                        color: _currentStep == 0
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF1F3C8B),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFD1D5DC),
                          width: 2,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: _currentStep == 0
                            ? null
                            : () {
                                if (_currentStep > 0) {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          shadowColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: _currentStep == 0
                                  ? Color.fromARGB(255, 140, 156, 180)
                                  : Colors.white,
                              size: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Anterior",
                              style: TextStyle(
                                color: _currentStep == 0
                                    ? Color.fromARGB(255, 140, 156, 180)
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_currentStep == steps.length - 1)
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F3C8B),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFD1D5DC),
                            width: 2,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: _currentStep == steps.length || _reproductionId == null
                              ? () {
                                context.read<PlaySequenceBloc>().add(
                                  CompleteSequence()
                                );
                              }
                              : () {
                                context.read<PlaySequenceBloc>().add(
                                  EndRoutineSequence(_reproductionId!),
                                );
                              },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            shadowColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Completar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          color: _currentStep == steps.length - 1
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF1F3C8B),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFD1D5DC),
                            width: 2,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: _currentStep == steps.length - 1
                              ? null
                              : () {
                                  if (_currentStep < steps.length - 1) {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            shadowColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Siguiente",
                                style: TextStyle(
                                  color: _currentStep == steps.length - 1
                                      ? Color.fromARGB(255, 140, 156, 180)
                                      : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: _currentStep == steps.length - 1
                                    ? Color.fromARGB(255, 140, 156, 180)
                                    : Colors.white,
                                size: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
          } else {
            return Center(
              child: Text(
                "Información no cargada",
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            );
          }
        },
      ),
    );
  }
}
