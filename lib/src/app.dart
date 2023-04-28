import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing/routing.dart';

/// Root scaffold messenger key used for showing snackbars anywhere in the app
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// The main app widget
class MyApp extends ConsumerWidget {
  /// Constructor for main app widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => 'PetSave',
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerDelegate: goRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      // theme: lightTheme,
    );
  }
}
