import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/onboarding.dart';
import 'package:petsave/src/home.dart';
import 'package:user_repository/user_repository.dart';

/// All the routes in the app
enum AppRoute {
  /// The initial route
  onboarding,

  /// Animals near you
  animalsNearYou,

  /// home
  home,
}

/// gorouter provider
final goRouterProvider = Provider<GoRouter>((ref) {
  final userRepository = ref.watch(userRepositoryPod);

  return GoRouter(
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
        // redirect: (context, state) async {
        //   // if the user is signed in, redirect to the animals page
        //   if (userRepository.isSignedIn()) {
        //     return '/animals';
        //   }
        //   return null;
        // },
        routes: [
          GoRoute(
            path: 'home',
            name: AppRoute.home.name,
            builder: (context, state) => const HomePage(),
          ),
        ],
      )
    ],
  );
});
