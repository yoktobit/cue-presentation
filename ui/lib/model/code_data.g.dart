// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeData _$CodeDataFromJson(Map<String, dynamic> json) => CodeData(
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => CodeRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CodeDataToJson(CodeData instance) => <String, dynamic>{
      'rows': instance.rows,
    };
