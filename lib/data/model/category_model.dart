import 'package:news/ui/resources/designs/design.dart';

class Category {
  final String? lightImage;
  final String? darkImage;
  final String? title ;

  Category({
    this.lightImage,
    this.darkImage,
    this.title
  });

  static List<Category> categories = [
    Category(title: "",  lightImage: AppImages.generalImage),
    Category(title: "",  lightImage: AppImages.businessImage),
    Category(title: "",  lightImage: AppImages.sportsImage),
    Category(title: "",  lightImage: AppImages.healthImage),
    Category(title: "",  lightImage: AppImages.entertainmentImage),
    Category(title: "",  lightImage: AppImages.technologyImage),
    Category(title: "",  lightImage: AppImages.scienceImage),

  ];

}