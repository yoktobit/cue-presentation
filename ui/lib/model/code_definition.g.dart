// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeDefinition _$CodeDefinitionFromJson(Map<String, dynamic> json) =>
    CodeDefinition(
      name: json['name'] as String,
      label: json['label'] as String,
      columns: (json['columns'] as List<dynamic>?)
              ?.map((e) => CodeColumn.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String?,
      isSingleRecord: json['isSingleRecord'] as bool? ?? false,
    );

Map<String, dynamic> _$CodeDefinitionToJson(CodeDefinition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'id': instance.id,
      'isSingleRecord': instance.isSingleRecord,
      'columns': instance.columns,
    };
