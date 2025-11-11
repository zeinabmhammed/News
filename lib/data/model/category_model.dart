import 'package:news/ui/resources/designs/design.dart';

class CategoryModel {
  final String? lightImage;
  final String? darkImage;
  final String? title ;
  final String? id;


  CategoryModel({
    this.lightImage,
    this.darkImage,
    this.title,
    this.id
  });

  static List<CategoryModel> categories = [
    CategoryModel(
        title: "General",
        id: "general",
        lightImage: AppImages.generalImage,
        darkImage: AppImages.generalLight
    ),
    CategoryModel(
        title: "Business",
        id: "business",
        lightImage: AppImages.businessImage,
        darkImage: AppImages.businessLight
    ),
    CategoryModel(
        title: "Sports",
        id: "sports",
        lightImage: AppImages.sportsImage,
        darkImage: AppImages.sportsLight
    ),
    CategoryModel(
        title: "Health",
        id: "health",
        lightImage: AppImages.healthImage,
        darkImage: AppImages.healthLight
    ),
    CategoryModel(
        title: "Entertainment",
        id: "entertainment",
        lightImage: AppImages.entertainmentImage,
        darkImage: AppImages.entertainmentLight
    ),
    CategoryModel(
        title: "Technology",
        id: "technology",
        lightImage: AppImages.technologyImage,
        darkImage: AppImages.technologyLight
    ),
    CategoryModel(
        title: "Science",
        id: "science",
        lightImage: AppImages.scienceImage,
        darkImage: AppImages.scienceLight
    ),

  ];

}