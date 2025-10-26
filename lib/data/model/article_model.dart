class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final String? author;
  final String? source;
  final DateTime? publishAt;

  ArticleModel({
    required this.image,
    this.title,
    required this.description,
    required this.author,
    this.source,
    required this.publishAt,
  });

  static List<ArticleModel> articles = [
    ArticleModel(
      image:
      'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?w=800',
      description:
      'Google just released Flutter 3.24 with major performance improvements, new Material 3 widgets, and better web rendering.',
      author: 'By: Sarah Johnson',
      publishAt: DateTime(2025, 10, 10),

    ),
    ArticleModel(
      image:
      'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800',
      description:
      'Cross-platform frameworks like Flutter and React Native continue to evolve, making app development faster and more efficient.',
      author: 'By: John Smith',
      publishAt: DateTime(2025, 9, 30),
    ),
    ArticleModel(
      image:
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      description:
      'Minimalism, 3D interfaces, and dark mode dominance — a look at the top UI/UX trends shaping 2025.',
      author: 'By: Emma Davis',
      publishAt: DateTime(2025, 8, 15),
    ),
    ArticleModel(
      image:
      'https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?w=800',
      description:
      'From GitHub Copilot to ChatGPT, here are the top AI-powered tools changing how we code in 2025.',
      author: 'By: Michael Lee',
      publishAt: DateTime(2025, 7, 5),


    ),
  ];
}