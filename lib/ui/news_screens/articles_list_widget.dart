import 'package:flutter/material.dart';
import 'package:news/api/model/response/articles/Articles.dart';
import 'package:news/ui/news_screens/widgets/article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;
  ArticlesListWidget(this.articles,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        var article = articles[index];
        return ArticleItemWidget(article: article);
      },
    );
  }
  }

