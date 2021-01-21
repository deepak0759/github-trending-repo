// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GitStore on _GitStore, Store {
  Computed<StoreState> _$mystateComputed;

  @override
  StoreState get mystate =>
      (_$mystateComputed ??= Computed<StoreState>(() => super.mystate)).value;
  Computed<StoreState> _$mySearchStateComputed;

  @override
  StoreState get mySearchState => (_$mySearchStateComputed ??=
          Computed<StoreState>(() => super.mySearchState))
      .value;

  final _$repoListAtom = Atom(name: '_GitStore.repoList');

  @override
  List<Item> get repoList {
    _$repoListAtom.context.enforceReadPolicy(_$repoListAtom);
    _$repoListAtom.reportObserved();
    return super.repoList;
  }

  @override
  set repoList(List<Item> value) {
    _$repoListAtom.context.conditionallyRunInAction(() {
      super.repoList = value;
      _$repoListAtom.reportChanged();
    }, _$repoListAtom, name: '${_$repoListAtom.name}_set');
  }

  final _$searchListAtom = Atom(name: '_GitStore.searchList');

  @override
  List<Item> get searchList {
    _$searchListAtom.context.enforceReadPolicy(_$searchListAtom);
    _$searchListAtom.reportObserved();
    return super.searchList;
  }

  @override
  set searchList(List<Item> value) {
    _$searchListAtom.context.conditionallyRunInAction(() {
      super.searchList = value;
      _$searchListAtom.reportChanged();
    }, _$searchListAtom, name: '${_$searchListAtom.name}_set');
  }

  final _$_repofutureAtom = Atom(name: '_GitStore._repofuture');

  @override
  ObservableFuture<Response<dynamic>> get _repofuture {
    _$_repofutureAtom.context.enforceReadPolicy(_$_repofutureAtom);
    _$_repofutureAtom.reportObserved();
    return super._repofuture;
  }

  @override
  set _repofuture(ObservableFuture<Response<dynamic>> value) {
    _$_repofutureAtom.context.conditionallyRunInAction(() {
      super._repofuture = value;
      _$_repofutureAtom.reportChanged();
    }, _$_repofutureAtom, name: '${_$_repofutureAtom.name}_set');
  }

  final _$_searchFutureAtom = Atom(name: '_GitStore._searchFuture');

  @override
  ObservableFuture<Response<dynamic>> get _searchFuture {
    _$_searchFutureAtom.context.enforceReadPolicy(_$_searchFutureAtom);
    _$_searchFutureAtom.reportObserved();
    return super._searchFuture;
  }

  @override
  set _searchFuture(ObservableFuture<Response<dynamic>> value) {
    _$_searchFutureAtom.context.conditionallyRunInAction(() {
      super._searchFuture = value;
      _$_searchFutureAtom.reportChanged();
    }, _$_searchFutureAtom, name: '${_$_searchFutureAtom.name}_set');
  }

  final _$getRepoListAsyncAction = AsyncAction('getRepoList');

  @override
  Future<void> getRepoList(int days) {
    return _$getRepoListAsyncAction.run(() => super.getRepoList(days));
  }

  final _$searchAsyncAction = AsyncAction('search');

  @override
  Future<void> search(dynamic query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }
}
