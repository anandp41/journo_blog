import 'package:journo_blog/data/repositories/auth_repo.dart';
import 'package:journo_blog/data/repositories/categories_repo.dart';
import 'package:journo_blog/data/repositories/tags_repo.dart';

import 'posts_repo.dart';

class Repository {
  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostRepo postRepo;
  final CategoriesRepo categoriesRepo;
  Repository({
    required this.categoriesRepo,
    required this.postRepo,
    required this.tagsRepo,
    required this.authRepo,
  });
}
