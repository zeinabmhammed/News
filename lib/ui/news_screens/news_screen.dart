import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/ui/news_screens/news_sources_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return FutureBuilder(
        future: ApiManger.getInstance().getNewsSources(category.id??""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return  Center(child: Text("Error"));
          }
         var response = snapshot.data;
          return NewsSourcesWidget(response?.sources??[]);

        }
    );
  }
}
