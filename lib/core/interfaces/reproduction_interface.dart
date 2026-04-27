import 'package:pantalla_login_ui/core/models/sequence_reproduction_stats.dart';

abstract class ReproductionServiceI {

  Future<int> startReproduction(int routineSequenceId);
  Future<void> endReproduction(SequenceReproductionStats reproductionStats);

}