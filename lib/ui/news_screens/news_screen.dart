import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/api/model/response/sources/Sources_response.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/ui/news_screens/news_sources_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<SourcesResponse>? _sourcesFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_sourcesFuture == null) {
      final category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
      _sourcesFuture = ApiManger.getInstance().getNewsSources(category.id ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        final response = snapshot.data;
        return NewsSourcesWidget(response?.sources ?? [], sourceName: '',);
      },
    );
  }
}