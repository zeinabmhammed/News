import 'package:flutter/material.dart';
import 'package:news/api/model/response/articles/Articles.dart';

class FullArticleScreen extends StatelessWidget {
  final Article article;
  final String sourceName;

  const FullArticleScreen({super.key, required this.article, required this.sourceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sourceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 12),
            Text(
              article.title ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              article.content ?? article.description ?? "",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}