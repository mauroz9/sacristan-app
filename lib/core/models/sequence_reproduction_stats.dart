class SequenceReproductionStats {
  final int reproductionId;
  final Map<int, int> stepViewCount; // Veces que se ha visto cada paso
  final Map<int, Duration> stepTotalViewTime; // Tiempo total por paso
  final int previousButtonClicks;
  final int nextButtonClicks;
  final int completeButtonClicks;
  final int exitButtonClicks;

  SequenceReproductionStats({
    required this.reproductionId,
    required this.stepViewCount,
    required this.stepTotalViewTime,
    required this.previousButtonClicks,
    required this.nextButtonClicks,
    required this.completeButtonClicks,
    required this.exitButtonClicks,
  });

  /// Convierte el modelo a un Map para enviar al backend
  Map<String, dynamic> toJson() {
    return {
      'reproductionId': reproductionId,
      'stepStats': stepViewCount.entries.map((e) => {
        'stepIndex': e.key,
        'viewCount': e.value,
        'totalViewTimeMs': stepTotalViewTime[e.key]?.inMilliseconds ?? 0,
      }).toList(),
      'buttonClicks': {
        'previous': previousButtonClicks,
        'next': nextButtonClicks,
        'complete': completeButtonClicks,
        'exit': exitButtonClicks,
      },
      'totalClicks': previousButtonClicks + nextButtonClicks + completeButtonClicks + exitButtonClicks,
      'totalSteps': stepViewCount.length,
    };
  }

  @override
  String toString() {
    return 'SequenceReproductionStats(reproductionId: $reproductionId, '
        'steps: ${stepViewCount.length}, '
        'totalClicks: ${previousButtonClicks + nextButtonClicks + completeButtonClicks + exitButtonClicks})';
  }
}
