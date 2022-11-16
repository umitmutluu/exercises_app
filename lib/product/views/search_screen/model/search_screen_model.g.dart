// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      name: json['name'] as String?,
      type: json['type'] as String?,
      muscle: json['muscle'] as String?,
      equipment: json['equipment'] as String?,
      difficulty: json['difficulty'] as String?,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'muscle': instance.muscle,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
    };
