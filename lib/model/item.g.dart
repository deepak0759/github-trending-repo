// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Item> _$itemSerializer = new _$ItemSerializer();

class _$ItemSerializer implements StructuredSerializer<Item> {
  @override
  final Iterable<Type> types = const [Item, _$Item];
  @override
  final String wireName = 'Item';

  @override
  Iterable<Object> serialize(Serializers serializers, Item object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.full_name != null) {
      result
        ..add('full_name')
        ..add(serializers.serialize(object.full_name,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.avatar_url != null) {
      result
        ..add('avatar_url')
        ..add(serializers.serialize(object.avatar_url,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.watchers_count != null) {
      result
        ..add('watchers_count')
        ..add(serializers.serialize(object.watchers_count,
            specifiedType: const FullType(int)));
    }
    if (object.language != null) {
      result
        ..add('language')
        ..add(serializers.serialize(object.language,
            specifiedType: const FullType(String)));
    }
    if (object.forks != null) {
      result
        ..add('forks')
        ..add(serializers.serialize(object.forks,
            specifiedType: const FullType(int)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.owner != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(object.owner,
            specifiedType: const FullType(Owner)));
    }
    if (object.open_issues != null) {
      result
        ..add('open_issues')
        ..add(serializers.serialize(object.open_issues,
            specifiedType: const FullType(int)));
    }
    if (object.clone_url != null) {
      result
        ..add('clone_url')
        ..add(serializers.serialize(object.clone_url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Item deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'full_name':
          result.full_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar_url':
          result.avatar_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'watchers_count':
          result.watchers_count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'forks':
          result.forks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner.replace(serializers.deserialize(value,
              specifiedType: const FullType(Owner)) as Owner);
          break;
        case 'open_issues':
          result.open_issues = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'clone_url':
          result.clone_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Item extends Item {
  @override
  final String full_name;
  @override
  final String name;
  @override
  final String avatar_url;
  @override
  final String url;
  @override
  final int watchers_count;
  @override
  final String language;
  @override
  final int forks;
  @override
  final String description;
  @override
  final Owner owner;
  @override
  final int open_issues;
  @override
  final String clone_url;

  factory _$Item([void Function(ItemBuilder) updates]) =>
      (new ItemBuilder()..update(updates)).build();

  _$Item._(
      {this.full_name,
      this.name,
      this.avatar_url,
      this.url,
      this.watchers_count,
      this.language,
      this.forks,
      this.description,
      this.owner,
      this.open_issues,
      this.clone_url})
      : super._();

  @override
  Item rebuild(void Function(ItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemBuilder toBuilder() => new ItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Item &&
        full_name == other.full_name &&
        name == other.name &&
        avatar_url == other.avatar_url &&
        url == other.url &&
        watchers_count == other.watchers_count &&
        language == other.language &&
        forks == other.forks &&
        description == other.description &&
        owner == other.owner &&
        open_issues == other.open_issues &&
        clone_url == other.clone_url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, full_name.hashCode),
                                            name.hashCode),
                                        avatar_url.hashCode),
                                    url.hashCode),
                                watchers_count.hashCode),
                            language.hashCode),
                        forks.hashCode),
                    description.hashCode),
                owner.hashCode),
            open_issues.hashCode),
        clone_url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Item')
          ..add('full_name', full_name)
          ..add('name', name)
          ..add('avatar_url', avatar_url)
          ..add('url', url)
          ..add('watchers_count', watchers_count)
          ..add('language', language)
          ..add('forks', forks)
          ..add('description', description)
          ..add('owner', owner)
          ..add('open_issues', open_issues)
          ..add('clone_url', clone_url))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item _$v;

  String _full_name;
  String get full_name => _$this._full_name;
  set full_name(String full_name) => _$this._full_name = full_name;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _avatar_url;
  String get avatar_url => _$this._avatar_url;
  set avatar_url(String avatar_url) => _$this._avatar_url = avatar_url;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _watchers_count;
  int get watchers_count => _$this._watchers_count;
  set watchers_count(int watchers_count) =>
      _$this._watchers_count = watchers_count;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  int _forks;
  int get forks => _$this._forks;
  set forks(int forks) => _$this._forks = forks;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  OwnerBuilder _owner;
  OwnerBuilder get owner => _$this._owner ??= new OwnerBuilder();
  set owner(OwnerBuilder owner) => _$this._owner = owner;

  int _open_issues;
  int get open_issues => _$this._open_issues;
  set open_issues(int open_issues) => _$this._open_issues = open_issues;

  String _clone_url;
  String get clone_url => _$this._clone_url;
  set clone_url(String clone_url) => _$this._clone_url = clone_url;

  ItemBuilder();

  ItemBuilder get _$this {
    if (_$v != null) {
      _full_name = _$v.full_name;
      _name = _$v.name;
      _avatar_url = _$v.avatar_url;
      _url = _$v.url;
      _watchers_count = _$v.watchers_count;
      _language = _$v.language;
      _forks = _$v.forks;
      _description = _$v.description;
      _owner = _$v.owner?.toBuilder();
      _open_issues = _$v.open_issues;
      _clone_url = _$v.clone_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Item other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Item;
  }

  @override
  void update(void Function(ItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Item build() {
    _$Item _$result;
    try {
      _$result = _$v ??
          new _$Item._(
              full_name: full_name,
              name: name,
              avatar_url: avatar_url,
              url: url,
              watchers_count: watchers_count,
              language: language,
              forks: forks,
              description: description,
              owner: _owner?.build(),
              open_issues: open_issues,
              clone_url: clone_url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'owner';
        _owner?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Item', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
