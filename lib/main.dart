import 'package:animal_repository/animal_repository.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // override the previous value with the new object
        sharedPreferencesServiceProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        // home: const SignInPage(),
        home: const OnboardingScreen());
  }
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
                  builder: (context) => const AnimalsPage(title: 'Animals'),
                ),
              );
            }

            // sign in
            await ref.read(userRepositoryPod).signIn();
            // navigate to the animals page
            callback();
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}

class AnimalsPage extends ConsumerStatefulWidget {
  const AnimalsPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends ConsumerState<AnimalsPage> {
  static const _pageSize = 20;

  final PagingController<int, Animal> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final animalstream = await ref.read(animalRepositoryPod.future).then(
          (value) => value.getAnimalListStream(
            page: pageKey,
            limit: _pageSize,
            fetchPolicy: AnimalFetchPolicy.cacheAndNetwork,
          ),
        );
    // Stream<List<Animal>> characterStream =
    //     RemoteApi.getCharacterStream(pageKey, _pageSize);
    animalstream.listen((newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    }, onError: (error) {
      _pagingController.error = error;
    });
  }

  Future<void> _refresh() async {
    // Reset the paging controller to the first page.
    _pagingController.refresh();
    // Fetch the first page of data again.
    await _fetchPage(_pagingController.firstPageKey);
  }

  @override
  Widget build(BuildContext context) =>
      // Don't worry about displaying progress or error indicators on screen; the
      // package takes care of that. If you want to customize them, use the
      // [PagedChildBuilderDelegate] properties.
      Scaffold(
        appBar: AppBar(
          title: const Text('Aniamls Near You'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: PagedListView<int, Animal>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Animal>(
              itemBuilder: (context, item, index) =>
                  Text(item.name ?? 'No name'),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
