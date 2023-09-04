// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Login(),
      );
    },
    HomePage.name: (routeData) {
      final args = routeData.argsAs<HomePageArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Home(
          authValues: args.authValues,
        ),
      );
    },
    BlogExpandedPage.name: (routeData) {
      final args = routeData.argsAs<BlogExpandedPageArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BlogExpanded(
          isLiked: args.isLiked,
          blog: args.blog,
          authValues: args.authValues,
        ),
      );
    },
    NewBlogPage.name: (routeData) {
      final args = routeData.argsAs<NewBlogPageArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewBlog(
          authValues: args.authValues,
        ),
      );
    },
  };
}

/// generated route for
/// [Login]
class LoginPage extends PageRouteInfo<void> {
  const LoginPage({List<PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Home]
class HomePage extends PageRouteInfo<HomePageArgs> {
  HomePage({
    required PostLogin authValues,
    List<PageRouteInfo>? children,
  }) : super(
          HomePage.name,
          args: HomePageArgs(
            authValues: authValues,
          ),
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const PageInfo<HomePageArgs> page = PageInfo<HomePageArgs>(name);
}

class HomePageArgs {
  const HomePageArgs({
    required this.authValues,
  });

  final PostLogin authValues;

  @override
  String toString() {
    return 'HomePageArgs{authValues: $authValues}';
  }
}

/// generated route for
/// [BlogExpanded]
class BlogExpandedPage extends PageRouteInfo<BlogExpandedPageArgs> {
  BlogExpandedPage({
    required bool isLiked,
    required GlobalBlogModel blog,
    required PostLogin authValues,
    List<PageRouteInfo>? children,
  }) : super(
          BlogExpandedPage.name,
          args: BlogExpandedPageArgs(
            isLiked: isLiked,
            blog: blog,
            authValues: authValues,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogExpandedPage';

  static const PageInfo<BlogExpandedPageArgs> page =
      PageInfo<BlogExpandedPageArgs>(name);
}

class BlogExpandedPageArgs {
  const BlogExpandedPageArgs({
    required this.isLiked,
    required this.blog,
    required this.authValues,
  });

  final bool isLiked;

  final GlobalBlogModel blog;

  final PostLogin authValues;

  @override
  String toString() {
    return 'BlogExpandedPageArgs{isLiked: $isLiked, blog: $blog, authValues: $authValues}';
  }
}

/// generated route for
/// [NewBlog]
class NewBlogPage extends PageRouteInfo<NewBlogPageArgs> {
  NewBlogPage({
    required PostLogin authValues,
    List<PageRouteInfo>? children,
  }) : super(
          NewBlogPage.name,
          args: NewBlogPageArgs(
            authValues: authValues,
          ),
          initialChildren: children,
        );

  static const String name = 'NewBlogPage';

  static const PageInfo<NewBlogPageArgs> page = PageInfo<NewBlogPageArgs>(name);
}

class NewBlogPageArgs {
  const NewBlogPageArgs({
    required this.authValues,
  });

  final PostLogin authValues;

  @override
  String toString() {
    return 'NewBlogPageArgs{authValues: $authValues}';
  }
}
