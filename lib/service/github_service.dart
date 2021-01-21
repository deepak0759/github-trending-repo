import 'package:chopper/chopper.dart';
// import 'package:github_trending/model/repo_model.dart';
// import 'package:built_collection/built_collection.dart';

part 'github_service.chopper.dart';

@ChopperApi(baseUrl: 'search/')
abstract class GitHubService extends ChopperService {
  static GitHubService create([ChopperClient client]) =>
      _$GitHubService(client);

  @Get(path:'repositories')
  Future<Response> getList(
    @Query('q') String query,
    @Query('sort') String stars,
    @Query('order') String desc,
    @Query('page') String start,
    @Query('per_page') String no
  );
}
