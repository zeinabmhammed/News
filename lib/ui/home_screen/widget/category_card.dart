import 'package:flutter/material.dart';
import 'package:news/data/model/category_model.dart';
import 'package:news/routes.dart';
import 'package:news/ui/resources/designs/design.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
       Navigator.pushReplacementNamed(
           context,
           AppRoutes.NewsScreen.route,
           arguments: category
       );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                isDarkMode
                    ? category.darkImage ?? category.lightImage!
                    : category.lightImage ?? category.darkImage!,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              left: index.isOdd ? 16 : null,
              right: index.isEven ? 16 : null,
              top: 16,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    child: Text(
                      category.title ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isDarkMode ? Colors.black : AppColors.light,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: index.isOdd ? 16 : null,
              right: index.isEven ? 16 : null,
              bottom: 16,
              child: Container(
                height: 54,
                padding: const EdgeInsets.only(left: 15, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84),
                  color: isDarkMode
                      ? Colors.grey.shade800.withOpacity(0.9)
                      : Colors.grey.shade300.withOpacity(0.9),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Transform.translate(
                      offset: const Offset(4, -1),
                      child: Container(
                        width: 54,
                        height: 54,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.black : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
