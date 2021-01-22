import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'owner.dart';
part 'item.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  static Serializer<Item> get serializer => _$itemSerializer;

  Item._();

  factory Item([updates(ItemBuilder b)]) = _$Item;

  @nullable
  String get full_name;
  @nullable
  String get name;
  @nullable
  String get avatar_url;
  @nullable
  String get url;
  @nullable
  int get watchers_count;
  @nullable
  String get language;
  @nullable
  int get forks;
  @nullable
  String get description;
  @nullable
  Owner get owner;
  @nullable
  int get open_issues;
  @nullable
  String get clone_url;
}
