import 'package:auto_route/auto_route.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/home/ui/home.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

import 'blog_expanded/ui/blog_expanded.dart';
import 'login/ui/login.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginPage.page, initial: true),
    AutoRoute(page: HomePage.page),
    AutoRoute(page: BlogExpandedPage.page)
  ];
}