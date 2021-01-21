import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:github_trending/model/owner.dart';
import 'package:github_trending/model/repo_model.dart';
import 'package:built_collection/built_collection.dart';

import 'item.dart';
part 'serializer.g.dart';

@SerializersFor([RepoModel,Item,Owner])
Serializers serializers = _$serializers;

Serializers standardSerializers =
(serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();