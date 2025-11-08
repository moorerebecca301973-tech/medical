class SystemConfiguration {
  final Map<String, bool> activeMetrics;
  final Map<String, String> normalRanges;

  SystemConfiguration({
    required this.activeMetrics,
    required this.normalRanges,
  });
}
