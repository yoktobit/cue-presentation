// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeRow _$CodeRowFromJson(Map<String, dynamic> json) => CodeRow(
      selected: json['selected'] as bool? ?? false,
      value: json['value'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CodeRowToJson(CodeRow instance) => <String, dynamic>{
      'value': instance.value,
      'selected': instance.selected,
    };
