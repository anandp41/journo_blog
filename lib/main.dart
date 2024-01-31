import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journo_blog/core/themes/app_themes.dart';
import 'package:journo_blog/data/repositories/auth_repo.dart';
import 'package:journo_blog/data/repositories/categories_repo.dart';
import 'package:journo_blog/data/repositories/posts_repo.dart';
import 'package:journo_blog/data/repositories/tags_repo.dart';
import 'package:journo_blog/presentation/router/router_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/velocity_bloc.dart';

import 'data/repositories/repository.dart';
import 'presentation/screens/general/profile/profile_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RepositoryProvider(
    create: (context) => Repository(
        categoriesRepo: CategoriesRepo(),
        tagsRepo: TagsRepo(),
        authRepo: AuthRepo(),
        postRepo: PostRepo()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => VelocityBloc<ProfileModel>(ProfileModel()),
            child: MaterialApp.router(
              title: 'Journo Blog',
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              themeMode: ThemeMode.system,
              //home: const MyHomePage(title: MyStrings.appName),
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
