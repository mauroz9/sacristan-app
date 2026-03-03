import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/core/services/routines_service.dart';
import 'package:pantalla_login_ui/features/sequences_to_do/bloc/sequences_to_do_bloc.dart';
import 'package:pantalla_login_ui/features/sequences_to_do/sequences_to_do.dart';

class SecuenciasHacerView extends StatelessWidget {
  const SecuenciasHacerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SequencesToDoBloc(RoutinesService()),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Secuencias por hacer",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F3C8B),
                    height: 0,
                  ),
                ),
              ),
              Expanded(
              flex: 9, 
              child: Center(
                child: SizedBox(
                  height: 550,
                  child: SequencesToDo()
                ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
