// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeLists _$CodeListsFromJson(Map<String, dynamic> json) => CodeLists(
      lists: (json['lists'] as List<dynamic>?)
              ?.map((e) => CodeList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      newObject: json['newObject'] as bool? ?? false,
      id: json['id'],
    );

Map<String, dynamic> _$CodeListsToJson(CodeLists instance) => <String, dynamic>{
      'newObject': instance.newObject,
      'lists': instance.lists,
      'id': instance.id,
    };
