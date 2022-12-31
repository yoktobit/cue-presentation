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
    );

Map<String, dynamic> _$CodeListsToJson(CodeLists instance) => <String, dynamic>{
      'lists': instance.lists,
    };
