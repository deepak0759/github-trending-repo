import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'owner.g.dart';

abstract class Owner implements Built<Owner, OwnerBuilder> {
  static Serializer<Owner> get serializer => _$ownerSerializer;

  Owner._();

  // factory CallSchedule([void Function(CallScheduleBuilder) updates]) = _$CallSchedule;

  factory Owner([updates(OwnerBuilder b)]) = _$Owner;

  @nullable
  String get avatar_url;

  @nullable
  String get html_url;

  @nullable
  int get id;
  @nullable
  String get login;

}