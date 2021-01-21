// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RepoModel> _$repoModelSerializer = new _$RepoModelSerializer();

class _$RepoModelSerializer implements StructuredSerializer<RepoModel> {
  @override
  final Iterable<Type> types = const [RepoModel, _$RepoModel];
  @override
  final String wireName = 'RepoModel';

  @override
  Iterable<Object> serialize(Serializers serializers, RepoModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.total_count != null) {
      result
        ..add('total_count')
        ..add(serializers.serialize(object.total_count,
            specifiedType: const FullType(int)));
    }
    if (object.items != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.items,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Item)])));
    }
    return result;
  }

  @override
  RepoModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RepoModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'total_count':
          result.total_count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Item)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$RepoModel extends RepoModel {
  @override
  final int total_count;
  @override
  final BuiltList<Item> items;

  factory _$RepoModel([void Function(RepoModelBuilder) updates]) =>
      (new RepoModelBuilder()..update(updates)).build();

  _$RepoModel._({this.total_count, this.items}) : super._();

  @override
  RepoModel rebuild(void Function(RepoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepoModelBuilder toBuilder() => new RepoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepoModel &&
        total_count == other.total_count &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, total_count.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RepoModel')
          ..add('total_count', total_count)
          ..add('items', items))
        .toString();
  }
}

class RepoModelBuilder implements Builder<RepoModel, RepoModelBuilder> {
  _$RepoModel _$v;

  int _total_count;
  int get total_count => _$this._total_count;
  set total_count(int total_count) => _$this._total_count = total_count;

  ListBuilder<Item> _items;
  ListBuilder<Item> get items => _$this._items ??= new ListBuilder<Item>();
  set items(ListBuilder<Item> items) => _$this._items = items;

  RepoModelBuilder();

  RepoModelBuilder get _$this {
    if (_$v != null) {
      _total_count = _$v.total_count;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepoModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RepoModel;
  }

  @override
  void update(void Function(RepoModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RepoModel build() {
    _$RepoModel _$result;
    try {
      _$result = _$v ??
          new _$RepoModel._(total_count: total_count, items: _items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RepoModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
