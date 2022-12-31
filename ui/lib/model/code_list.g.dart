// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeList _$CodeListFromJson(Map<String, dynamic> json) => CodeList(
      definition: json['definition'] == null
          ? null
          : CodeDefinition.fromJson(json['definition'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : CodeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CodeListToJson(CodeList instance) => <String, dynamic>{
      'definition': instance.definition,
      'data': instance.data,
    };
