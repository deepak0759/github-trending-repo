import 'package:chopper/chopper.dart';
import 'package:github_trending/utils/app_constants.dart';

part 'github_service.chopper.dart';

@ChopperApi(baseUrl: API_URL)
abstract class GitHubService extends ChopperService {
  static GitHubService create([ChopperClient client]) =>
      _$GitHubService(client);

  @Get(path:'')
  Future<Response> getList(
    @Query('q') String query,
    @Query('sort') String stars,
    @Query('order') String desc,
    @Query('page') String start,
    @Query('per_page') String no
  );
}
