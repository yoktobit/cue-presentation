import 'package:json_annotation/json_annotation.dart';
import 'package:test1/model/code_list.dart';

part 'code_lists.g.dart';

@JsonSerializable()
class CodeLists {
  final bool newObject;
  final List<CodeList> lists;

  const CodeLists({this.lists = const [], this.newObject = false});

  factory CodeLists.fromJson(Map<String, dynamic> json) =>
      _$CodeListsFromJson(json);

  factory CodeLists.newEmpty() => const CodeLists(lists: [], newObject: true);

  Map<String, dynamic> toJson() => _$CodeListsToJson(this);
}
