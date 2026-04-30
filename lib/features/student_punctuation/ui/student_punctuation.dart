import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/features/student_punctuation/bloc/student_punctuation_bloc.dart';

class StudentPunctuation extends StatelessWidget {
  const StudentPunctuation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentPunctuationBloc, StudentPunctuationState>(
      builder: (context, state) {
        return Column(
          spacing: 20,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star_border_rounded,
                  size: 35,
                  color: const Color(0xFF1F3C8B),
                ),
                Text(
                  "Puntuaciones",
                  style: TextStyle(
                    fontSize: 22,
                    color: const Color(0xFF1F3C8B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            _buildPunctuationContent(state),
          ],
        );
      },
    );
  }

  Widget _buildPunctuationContent(StudentPunctuationState state) {
    if (state is StudentPunctuationLoading) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (state is StudentPunctuationError) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 50,
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (state is StudentPunctuationSuccess) {
      final response = state.response;
      
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPunctuationCard(
                icon: Icons.check,
                iconColor: const Color(0xFF00A63E),
                bgColor: const Color(0xFFDCFCE7),
                value: response.completadas.toString(),
                label: "Completadas",
              ),
              _buildPunctuationCard(
                icon: Icons.calendar_today_outlined,
                iconColor: const Color(0xFF155DFC),
                bgColor: const Color(0xFFDBEAFE),
                value: response.activas.toString(),
                label: "Activas",
              ),
              _buildPunctuationCard(
                icon: Icons.auto_graph_outlined,
                iconColor: const Color(0xFFF54900),
                bgColor: const Color(0xFFFFEDD4),
                value: response.diasRacha.toString(),
                label: "Días racha",
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Cargando puntuaciones..."),
      ),
    );
  }

  Widget _buildPunctuationCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String value,
    required String label,
  }) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF4A5565),
          ),
        ),
      ],
    );
  }
}
