import 'package:chopper/chopper.dart';
import 'package:github_trending/model/item.dart';
import 'package:github_trending/model/repo_model.dart';
import 'package:github_trending/model/serializer.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:mobx/mobx.dart';
import 'package:date_format/date_format.dart';

part 'github_store.g.dart';

class GitStore extends _GitStore with _$GitStore {
  GitStore(GitHubService gitHubService) : super(gitHubService);
}
enum StoreState { initial, loading, loaded }
abstract class _GitStore with Store {
  final GitHubService _gitHubService;

  _GitStore(this._gitHubService);

  @observable
  List<Item> repoList=List();
  @observable
  List<Item> searchList=List();
  @observable
  ObservableFuture<Response> _repofuture;
  @observable
  ObservableFuture<Response> _searchFuture;

  @computed
  StoreState get mystate {
    if (_repofuture == null ||
        _repofuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _repofuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @computed
  StoreState get mySearchState {
    if (_searchFuture == null ||
        _searchFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _searchFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<void> getRepoList(int days)async{
    final lastWeek = DateTime.now().subtract(Duration(days: days));
    final formattedDate = formatDate(lastWeek, [yyyy, '-', mm, '-', dd]);
  _repofuture=ObservableFuture(_gitHubService.getList('created:>$formattedDate', 'stars', 'desc', '0', '25'));
  var response=await _repofuture;

    final list = standardSerializers.deserializeWith(
        RepoModel.serializer, response.body);
    print(List);
    repoList.clear();
    for(var item in list.items){
    repoList.add(item);
    }
    print(repoList);
  }
@action
  Future<void> search(var query)async{
  _searchFuture=ObservableFuture(_gitHubService.getList(query, 'stars', 'desc', 'start', '25'));
  var response=await _searchFuture;
  final list=standardSerializers.deserializeWith(RepoModel.serializer, response.body);
  searchList.clear();
  for(var item in list.items){
    searchList.add(item);
  }
  print(searchList);
}
}