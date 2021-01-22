import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'item.dart';

part 'repo_model.g.dart';

abstract class RepoModel implements Built<RepoModel, RepoModelBuilder> {
  static Serializer<RepoModel> get serializer => _$repoModelSerializer;

  RepoModel._();

  factory RepoModel([updates(RepoModelBuilder b)]) = _$RepoModel;

  @nullable
  int get total_count;
  @nullable
  BuiltList<Item> get items;
}
