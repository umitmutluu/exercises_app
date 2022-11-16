import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'search_screen_model.g.dart';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
    json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class SearchModel {
  SearchModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  final String? name;
  final String? type;
  final String? muscle;
  final String? equipment;
  final String? difficulty;
  final String? instructions;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
