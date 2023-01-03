import 'package:cbor/cbor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/globals.dart';
import 'package:uuid/uuid.dart';

part 'code_lists.g.dart';

@JsonSerializable()
class CodeLists {
  @JsonKey(ignore: true)
  final bool newObject;
  final List<CodeList> lists;
  late String id;

  CodeLists({this.lists = const [], this.newObject = false, id}) {
    if (id != null) {
      this.id = id;
    } else {
      this.id = const Uuid().v4();
    }
  }

  factory CodeLists.fromJson(Map<String, dynamic> json) =>
      _$CodeListsFromJson(json);

  factory CodeLists.newEmpty() => CodeLists(lists: [], newObject: true);

  Map<String, dynamic> toJson() => _$CodeListsToJson(this);

  CborValue toCbor() {
    return CborValue({
      "id": id,
      "lists": CborList(lists.map((e) => e.toCbor()).toList()),
    });
  }
}
