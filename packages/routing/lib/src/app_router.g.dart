// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $onboardingRouteData,
      $homeRouteData,
    ];

RouteBase get $onboardingRouteData => GoRouteData.$route(
      path: '/',
      factory: $OnboardingRouteDataExtension._fromState,
    );

extension $OnboardingRouteDataExtension on OnboardingRouteData {
  static OnboardingRouteData _fromState(GoRouterState state) =>
      const OnboardingRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $homeRouteData => ShellRouteData.$route(
      factory: $HomeRouteDataExtension._fromState,
      navigatorKey: HomeRouteData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/animals',
          factory: $AnimalsRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':animalId',
              factory: $AnimalDetailsRouteDataExtension._fromState,
              parentNavigatorKey: AnimalDetailsRouteData.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/search',
          factory: $SearchRouteDataExtension._fromState,
        ),
      ],
    );

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();
}

extension $AnimalsRouteDataExtension on AnimalsRouteData {
  static AnimalsRouteData _fromState(GoRouterState state) =>
      const AnimalsRouteData();

  String get location => GoRouteData.$location(
        '/animals',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AnimalDetailsRouteDataExtension on AnimalDetailsRouteData {
  static AnimalDetailsRouteData _fromState(GoRouterState state) =>
      AnimalDetailsRouteData(
        int.parse(state.params['animalId']!),
      );

  String get location => GoRouteData.$location(
        '/animals/${Uri.encodeComponent(animalId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SearchRouteDataExtension on SearchRouteData {
  static SearchRouteData _fromState(GoRouterState state) =>
      const SearchRouteData();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
