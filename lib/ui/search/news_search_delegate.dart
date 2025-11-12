import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/api/model/response/articles/Articles_response.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Search"));
    }

    return FutureBuilder<ArticlesResponse>(
      future: ApiManger.getInstance().searchArticles(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        final articles = snapshot.data!.articles ?? [];
        if (articles.isEmpty) return Center(child: Text("No results found"));
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final a = articles[index];
            return ListTile(
              leading: a.urlToImage != null
                  ? Image.network(a.urlToImage!, width: 60, fit: BoxFit.cover)
                  : Icon(Icons.article),
              title: Text(a.title ?? ""),
              subtitle: Text(a.description ?? "", maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () {
              },
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    if (query.isNotEmpty)
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }
}