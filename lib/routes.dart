import 'package:auto_route/auto_route.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/home/ui/home.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/new_blog/ui/new_blog.dart';
import 'package:microchirp_frontend/search_blogs/ui/search_blogs.dart';
import 'package:microchirp_frontend/splash_screen/splash_screen.dart';

import 'blog_expanded/ui/blog_expanded.dart';
import 'login/ui/login.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenPage.page, initial: true),
    AutoRoute(page: LoginPage.page),
    AutoRoute(page: HomePage.page),
    AutoRoute(page: BlogExpandedPage.page),
    AutoRoute(page: NewBlogPage.page),
    AutoRoute(page: SearchBlogsPage.page)
  ];
}