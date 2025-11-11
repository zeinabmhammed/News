import 'package:flutter/material.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/ui/home_screen/widget/category_card.dart';
import '../common/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Home",
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Text("Good Morning",
            style: Theme.of(context).textTheme.titleLarge),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,bottom: 16),
            child: Text(" Here is Some News For You",
              style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context , index){
                  var category = CategoryModel.categories[index];
                  return CategoryCard(category: category, index: index,);
                },
                separatorBuilder: (context , index)=> SizedBox(height: 8,),
                itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
