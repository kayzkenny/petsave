import 'package:animals_near_you/animals_near_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/onboarding.dart';
import 'package:routing/src/routing_base.dart';
import 'package:search/search.dart';
import 'package:user_repository/user_repository.dart';

part 'app_router.g.dart';

/// All the routes in the app
enum AppRoute {
  /// The initial route
  onboarding,

  /// home
  animals,

  /// animal details
  animalDetails,

  /// search
  search,
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      NotFoundScreen(error: error);
}

@TypedGoRoute<OnboardingRouteData>(path: '/')
class OnboardingRouteData extends GoRouteData {
  const OnboardingRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingPage();
}

@TypedShellRoute<HomeRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AnimalsRouteData>(
      path: '/animals',
      routes: <TypedGoRoute<AnimalDetailsRouteData>>[
        TypedGoRoute<AnimalDetailsRouteData>(path: ':animalId'),
      ],
    ),
    TypedGoRoute<SearchRouteData>(path: '/search'),
  ],
)
class HomeRouteData extends ShellRouteData {
  const HomeRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomePage(child: navigator);
  }
}

class AnimalsRouteData extends GoRouteData {
  const AnimalsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AnimalsNearYouPage();
  }
}

class AnimalDetailsRouteData extends GoRouteData {
  const AnimalDetailsRouteData(this.animalId);
  final int animalId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AnimalDetailsPage(animalId: animalId);
  }
}

class SearchRouteData extends GoRouteData {
  const SearchRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

/// gorouter provider
final goRouterProvider = Provider<GoRouter>((ref) {
  final userRepository = ref.watch(userRepositoryPod);

  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) async {
      // if the user is signed in, redirect to the animals page
      if (state.location == OnboardingRouteData().location &&
          userRepository.isSignedIn()) {
        return AnimalsRouteData().location;
      }

      return null;
    },
    errorBuilder: (c, s) => NotFoundScreen(error: s.error!).build(c),
  );
});
