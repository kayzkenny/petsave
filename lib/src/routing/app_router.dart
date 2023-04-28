import 'package:animals_near_you/animals_near_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/onboarding.dart';
import 'package:petsave/src/home.dart';
import 'package:search/search.dart';
import 'package:user_repository/user_repository.dart';

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

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

/// gorouter provider
final goRouterProvider = Provider<GoRouter>((ref) {
  final userRepository = ref.watch(userRepositoryPod);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) async {
      // if the user is signed in, redirect to the animals page
      if (userRepository.isSignedIn()) {
        return '/animals';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.onboarding.name,
        builder: (context, state) => const OnboardingPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/animals',
            name: AppRoute.animals.name,
            builder: (context, state) => const AnimalsNearYouPage(),
            routes: [
              GoRoute(
                path: ':animalId',
                name: AppRoute.animalDetails.name,
                builder: (context, state) {
                  final animalId = int.parse(state.params['animalId']!);
                  return AnimalDetailsPage(animalId: animalId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/search',
            name: AppRoute.search.name,
            builder: (context, state) => const SearchPage(),
          ),
        ],
      ),
    ],
  );
});

// GoRoute(
//   path: '/',
//   name: AppRoute.onboarding.name,
//   builder: (context, state) => const OnboardingPage(),
//   redirect: (context, state) async {
//     // if the user is signed in, redirect to the animals page
//     if (userRepository.isSignedIn()) {
//       return '/home';
//     }
//     return null;
//   },
// ),
// GoRoute(
//   path: '/home',
//   name: AppRoute.home.name,
//   builder: (context, state) => const HomePage(),
// ),
// GoRoute(
//   path: '/animals/:animalId',
//   name: AppRoute.animalDetails.name,
//   builder: (context, state) {
//     final animalId = int.parse(state.params['animalId']!);
//     return AnimalDetailsPage(animalId: animalId);
//   },
// ),
// ShellRoute(
//   navigatorKey: _shellNavigatorKey,
// ),