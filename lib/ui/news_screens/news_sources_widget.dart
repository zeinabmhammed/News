import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/api/model/response/sources/Sources.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/ui/common/widgets/custom_scaffold.dart';
import 'package:news/ui/news_screens/articles_list_widget.dart';
import 'package:news/ui/search/search_results_list.dart';

class NewsSourcesWidget extends StatefulWidget {
  List<Source> tabs;
  final String sourceName;

  NewsSourcesWidget(this.tabs,{super.key, required this.sourceName});

  @override
  State<NewsSourcesWidget> createState() => _NewsSourcesWidgetState();
}

class _NewsSourcesWidgetState extends State<NewsSourcesWidget> {
  int selectedIndex = 0;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return DefaultTabController(
      length: widget.tabs.length,
      child: CustomScaffold(
        title: category.title ?? "",
        enableSearch: true,
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        actions: [],
        body:  _searchQuery.isEmpty
            ? Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
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
              tabs: widget.tabs
                  .map((source) => Tab(text: source.name))
                  .toList(),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiManger.getInstance().getArticlesSources(
                  widget.tabs[selectedIndex].id ?? "",
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error"));
                  }
                  final response = snapshot.data;
                  final articles = response?.articles ?? [];

                  return ArticlesListWidget(
                    articles,
                    sourceName: widget.tabs[selectedIndex].name ?? "",
                  );
                },
              ),
            ),
          ],
        ): SearchResultsList(query: _searchQuery),
      ),
    );
  }
}
