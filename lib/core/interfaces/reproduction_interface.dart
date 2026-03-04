abstract class ReproductionServiceI {

  Future<int> startReproduction(int routineSequenceId);
  Future<void> endReproduction(int reproductionId);

}