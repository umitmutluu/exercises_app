enum NetworkQuery { valueQueryMuscle, valueQueryType }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, String> valueQueryMuscleFunc(String valueQuery) =>
      MapEntry('muscle', valueQuery);
  MapEntry<String, String> valueQueryTypeFunc(String valueQuery) =>
      MapEntry('muscle', valueQuery);
}
