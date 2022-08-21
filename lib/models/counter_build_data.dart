class CounterBuildData {
  int? numMatchesEvaluated;
  List<Map<String, double>>? counterBuild;

  CounterBuildData({
    required this.numMatchesEvaluated,
    required this.counterBuild,
  });

  CounterBuildData.fromJson(Map<String, dynamic> json) {
    numMatchesEvaluated = json['numMatchesEvaluated'];
    counterBuild = json['counterBuild'];
  }
}
