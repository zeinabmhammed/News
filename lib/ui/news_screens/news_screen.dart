import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/model/article_model.dart';
import 'package:news/ui/common/widgets/custom_scaffold.dart';
import 'package:news/ui/news_screens/widgets/article_item_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // todo get this from apis
  List<String> tabList = [
    "Alahly",
    "Zamalek",
    "Nile",
    "On",
    "Dmc",
    "Sport",
    "magazine",
    "Nile",
    "On",
    "Dmc",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: CustomScaffold(
        title: 'Home',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        ],
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              labelStyle: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: tabList.map((String tab) => Tab(text: tab)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tabList.map((String tab) {
                  return ListView.builder(
                    itemCount: ArticleModel.articles.length,
                    itemBuilder: (context, index) {
                      var article = ArticleModel.articles[index];
                      return ArticleItemWidget(article: article);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
