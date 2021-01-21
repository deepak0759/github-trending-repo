// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$GitHubService extends GitHubService {
  _$GitHubService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GitHubService;

  @override
  Future<Response> getList(
      String query, String stars, String desc, String start, String no) {
    final $url = 'search/repositories';
    final $params = <String, dynamic>{
      'q': query,
      'sort': stars,
      'order': desc,
      'page': start,
      'per_page': no
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
