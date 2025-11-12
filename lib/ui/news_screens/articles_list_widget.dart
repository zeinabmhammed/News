import 'package:flutter/material.dart';
import 'package:news/api/model/response/articles/Articles.dart';
import 'package:news/ui/news_screens/widgets/article_item_widget.dart';


class ArticlesListWidget extends StatelessWidget {
  final List<Article> articles;
  final String sourceName;

  const ArticlesListWidget(this.articles, {super.key, required this.sourceName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleItemWidget(article: article, sourceName:sourceName ,

        );
      },
    );
  }
}