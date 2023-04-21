import 'dart:async';

import 'package:animals_near_you/animals_near_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petsave/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_repository/user_repository.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final sharedPreferences = await SharedPreferences.getInstance();

      runApp(
        ProviderScope(
          overrides: [
            // override the previous value with the new object
            sharedPreferencesServiceProvider
                .overrideWithValue(sharedPreferences),
          ],
          child: const MyApp(),
        ),
      );

      // * This code will present some error UI if any uncaught exception happens
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('An error occurred'),
          ),
          body: Center(child: Text(details.toString())),
        );
      };
    },
    (Object error, StackTrace stack) {
      // * Log any errors to console
      debugPrint(error.toString());
    },
  );
}

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // use the petfinder api to sign in
    // get the access token and store it in the shared preferences
    // then navigate to the animals page

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            void callback() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AnimalsNearYouPage(),
                ),
              );
            }

            // sign in
            await ref.read(userRepositoryPod).refreshToken();
            // navigate to the animals page
            callback();
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
