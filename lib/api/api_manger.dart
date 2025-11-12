import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/response/articles/Articles_response.dart';
import 'package:news/api/model/response/sources/Sources_response.dart';

class ApiManger {
  //singleton
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesApi = "v2/top-headlines/sources";
  static const String _articlesApi = "v2/everything";
  static const String _apiKey = "6bf3e500a81e47c3aab306a46c42c0b2";

  ApiManger._();

  static ApiManger? _instance;

  static ApiManger getInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<SourcesResponse> getNewsSources(String category) async {
    // get news sources from api
    var params = {"apiKey": _apiKey, "category": category};

    var uri = Uri.https(_baseUrl, _sourcesApi, params);
    var response = await http.get(uri);

    print("sources Api : ${response.body}");
    print("sources Api : ${response.statusCode}");

    //parsing serialization
    var json = jsonDecode(response.body);
    SourcesResponse  sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;

  }

  Future<ArticlesResponse> getArticlesSources(String sourceId) async {
    // get news sources from api
    var params = {
      "apiKey": _apiKey,
      "sources": sourceId
    };

    var uri = Uri.https(_baseUrl, _articlesApi, params);
    var response = await http.get(uri);

    print("sources Api : ${response.body}");
    print("sources Api : ${response.statusCode}");

    //parsing serialization
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;


  }

  Future<ArticlesResponse> searchArticles(String query) async {
    var params = {
      "apiKey": _apiKey,
      "q": query,
      "language": "en",
      "pageSize": "30",
    };

    var uri = Uri.https(_baseUrl, _articlesApi, params);
    var response = await http.get(uri);

    print("Search Api : ${response.body}");
    print("Search Api Status: ${response.statusCode}");

    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }


}
