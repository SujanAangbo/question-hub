import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

/// A small wrapper around AutoRoute navigation so you can call:
/// AppRouterHelper.push(const HomeRoute());
/// AppRouterHelper.pop();
///
/// Setup:
/// 1) Provide [router] once at app start.
/// 2) Optionally also provide [navigatorKey] if you want fallback pop().
class AppRouterHelper {
  AppRouterHelper._();

  static StackRouter? _router;
  static GlobalKey<NavigatorState>? _navigatorKey;

  /// Call this once (e.g. in main.dart) after creating your AppRouter.
  static void init({
    required StackRouter router,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    _router = router;
    _navigatorKey = navigatorKey;
  }

  static StackRouter get _r {
    final r = _router;
    if (r == null) {
      throw StateError(
        'AppRouterHelper not initialized. Call AppRouterHelper.init(router: appRouter) first.',
      );
    }
    return r;
  }

  /// Push a route on top.
  static Future<T?> push<T>(PageRouteInfo<dynamic> route) {
    return _r.push<T>(route);
  }

  /// Replace current route with [route].
  static Future<T?> replace<T>(PageRouteInfo<dynamic> route) {
    return _r.replace<T>(route);
  }

  /// Pop current route (optionally with a result).
  static void pop<T extends Object?>([T? result]) {
    if (_r.canPop()) {
      _r.pop<T>(result);
      return;
    }

    // Optional fallback if you configured a navigatorKey
    final nav = _navigatorKey?.currentState;
    if (nav?.canPop() ?? false) {
      nav!.pop<T>(result);
    }
  }

  /// Pop until the first route (like "back to root").
  static void popToRoot() {
    _r.popUntilRoot();
  }

  /// Pop until a route name matches (auto_route uses routeName strings).
  static void popUntilRouteName(String routeName) {
    _r.popUntil((route) => route.settings.name == routeName);
  }

  /// Push [route] and remove routes until [predicate] returns true.
  ///
  /// Example:
  /// AppRouterHelper.pushAndPopUntil(const HomeRoute(),
  ///   predicate: (r) => r.settings.name == LoginRoute.name,
  /// );
  static Future<T?> pushAndPopUntil<T>(
    PageRouteInfo<dynamic> route, {
    required bool Function(Route<dynamic>) predicate,
  }) {
    return _r.pushAndPopUntil<T>(route, predicate: predicate);
  }

  /// Remove all routes and push [route] (typical after login/logout).
  static Future<void> removeAllAndPush<T>(PageRouteInfo<dynamic> route) {
    return _r.replaceAll([route]);
  }

  /// Replace whole stack with multiple routes.
  /// Useful for deep links / tab setups.
  static Future<void> replaceAll(List<PageRouteInfo<dynamic>> routes) {
    return _r.replaceAll(routes);
  }

  /// Navigate to a route (auto_route will reuse an existing one if appropriate).
  static Future<void> navigate(PageRouteInfo<dynamic> route) {
    return _r.navigate(route);
  }

  /// Push a route only if it isn't already on top.
  static Future<T?> pushIfNotCurrent<T>(PageRouteInfo<dynamic> route) async {
    final top = _r.current.name;
    if (top == route.routeName) return null;
    return _r.push<T>(route);
  }

  /// Returns true if you can pop.
  static bool canPop() => _r.canPop();

  /// Convenience: read current route name.
  static String? currentRouteName() => _r.current.name;
}
