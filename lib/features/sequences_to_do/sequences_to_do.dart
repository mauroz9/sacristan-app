import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/features/sequences_to_do/bloc/sequences_to_do_bloc.dart';
import 'package:pantalla_login_ui/features/sequences_to_do/ui/widgets/sequence_card.dart';

class SequencesToDo extends StatefulWidget {
  const SequencesToDo({super.key});

  @override
  State<SequencesToDo> createState() => _SequencesToDoState();
}

class _SequencesToDoState extends State<SequencesToDo> {
  @override
  void initState() {
    super.initState();
    context.read<SequencesToDoBloc>().add(FetchPendingSequences());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SequencesToDoBloc, SequencesToDoState>(
      builder: (context, state) {
        if (state is SequencesToDoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SequencesToDoError) {
          return Center(child: Text(state.message));
        }

        if (state is SequencesToDoSuccess) {
          if (state.sequences.isEmpty) {
            return const Center(
              child: Text(
                "No hay secuencias pendientes",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF1F3C8B),
                ),
              ),
            );
          }

          return ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: state.sequences.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final sequence = state.sequences[index];

              final Map<String, Color> timeMap = {
                "Pendiente": const Color.fromARGB(255, 85, 77, 77),
                "Ahora": const Color.fromARGB(255, 90, 136, 196),
                "Futuro": const Color.fromARGB(255, 77, 201, 143),
              };
              final parts = sequence.startTime.toString().split(':');
              DateTime timeStamp = DateTime.now().copyWith(
                hour: int.parse(parts[0]),
                minute: int.parse(parts[1]),
                second: 0,
                millisecond: 0,
              );
              final now = DateTime.now();
              timeStamp = timeStamp.subtract( Duration(hours: 1));

              final String timeLabel = timeStamp.isBefore(now.subtract(Duration(minutes: 5)))
                  ? "Pendiente"
                  : timeStamp.isAfter(now.add(Duration(minutes: 5)))
                      ? "Futuro"
                      : "Ahora";

              return SequenceCard(
                id: sequence.id,
                title: sequence.name,
                time: sequence.startTime,
                idImagen: sequence.frontImageId.toString(),
                timeLabel: timeLabel,
                timeColor: timeMap[timeLabel]!,
                routineSequenceId: sequence.routineSequenceId,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}