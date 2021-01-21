// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Owner> _$ownerSerializer = new _$OwnerSerializer();

class _$OwnerSerializer implements StructuredSerializer<Owner> {
  @override
  final Iterable<Type> types = const [Owner, _$Owner];
  @override
  final String wireName = 'Owner';

  @override
  Iterable<Object> serialize(Serializers serializers, Owner object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.avatar_url != null) {
      result
        ..add('avatar_url')
        ..add(serializers.serialize(object.avatar_url,
            specifiedType: const FullType(String)));
    }
    if (object.html_url != null) {
      result
        ..add('html_url')
        ..add(serializers.serialize(object.html_url,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.login != null) {
      result
        ..add('login')
        ..add(serializers.serialize(object.login,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Owner deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OwnerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'avatar_url':
          result.avatar_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.html_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Owner extends Owner {
  @override
  final String avatar_url;
  @override
  final String html_url;
  @override
  final int id;
  @override
  final String login;

  factory _$Owner([void Function(OwnerBuilder) updates]) =>
      (new OwnerBuilder()..update(updates)).build();

  _$Owner._({this.avatar_url, this.html_url, this.id, this.login}) : super._();

  @override
  Owner rebuild(void Function(OwnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OwnerBuilder toBuilder() => new OwnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Owner &&
        avatar_url == other.avatar_url &&
        html_url == other.html_url &&
        id == other.id &&
        login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, avatar_url.hashCode), html_url.hashCode), id.hashCode),
        login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Owner')
          ..add('avatar_url', avatar_url)
          ..add('html_url', html_url)
          ..add('id', id)
          ..add('login', login))
        .toString();
  }
}

class OwnerBuilder implements Builder<Owner, OwnerBuilder> {
  _$Owner _$v;

  String _avatar_url;
  String get avatar_url => _$this._avatar_url;
  set avatar_url(String avatar_url) => _$this._avatar_url = avatar_url;

  String _html_url;
  String get html_url => _$this._html_url;
  set html_url(String html_url) => _$this._html_url = html_url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  OwnerBuilder();

  OwnerBuilder get _$this {
    if (_$v != null) {
      _avatar_url = _$v.avatar_url;
      _html_url = _$v.html_url;
      _id = _$v.id;
      _login = _$v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Owner other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Owner;
  }

  @override
  void update(void Function(OwnerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Owner build() {
    final _$result = _$v ??
        new _$Owner._(
            avatar_url: avatar_url, html_url: html_url, id: id, login: login);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
