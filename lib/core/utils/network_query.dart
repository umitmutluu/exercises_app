enum NetworkQuery { muscle, type }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, String> muscleQuery(String muscleQuery) =>
      MapEntry('muscle', muscleQuery);
  MapEntry<String, String> typeQuery(String typeQuery) =>
      MapEntry('type', typeQuery);
}
