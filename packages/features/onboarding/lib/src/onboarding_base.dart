import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/creature_dog-and-bone.png',
  'assets/images/creature-bird-blue-fly.png',
  'assets/images/creature-cat-ball.png',
];

final List<String> headingList = [
  'Welcome to PetSave',
  'Search...',
  'Nearby',
];

final List<String> subheadingList = [
  'Looking for a Pet?\nThen you are in the right place.',
  'Search from a list of our huge database of animals.',
  'Find pets to adopt from nearby your place...',
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
            ),
            children: [
              Image.asset("assets/images/creature_dog-and-bone.png"),
              Image.asset("assets/images/creature-bird-blue-fly.png"),
              Image.asset("assets/images/creature-cat-ball.png"),
              Image.asset("assets/images/creature-cat-purple-cute.png"),
              Image.asset("assets/images/creature-cat-purr.png"),
              Image.asset("assets/images/creature-chameleon.png"),
              Image.asset("assets/images/creature-dog-bone.png"),
              Image.asset("assets/images/creature-dog-sitting.png"),
              Image.asset("assets/images/creature-dog-tennis-ball.png"),
              Image.asset("assets/images/creature_dog-and-bone.png"),
              Image.asset("assets/images/creature-bird-blue-fly.png"),
              Image.asset("assets/images/creature-cat-ball.png"),
              Image.asset("assets/images/creature-cat-purple-cute.png"),
              Image.asset("assets/images/creature-cat-purr.png"),
              Image.asset("assets/images/creature-chameleon.png"),
              Image.asset("assets/images/creature-dog-bone.png"),
              Image.asset("assets/images/creature-dog-sitting.png"),
              Image.asset("assets/images/creature-dog-tennis-ball.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CarouselSlider(
                    items: imgList
                        .map((item) => Container(
                              // color: Colors.white,
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.all(32.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFffffff),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                // add a shadow
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const Spacer(),
                                  Text(
                                    headingList[imgList.indexOf(item)],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    subheadingList[imgList.indexOf(item)],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    imgList[imgList.indexOf(item)],
                                    // fit: BoxFit.fitHeight,
                                    height: 100,
                                    width: 100,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Container(
                                        width: 64,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: imgList
                                              .asMap()
                                              .entries
                                              .map((entry) {
                                            return GestureDetector(
                                              onTap: () => _controller
                                                  .animateToPage(entry.key),
                                              child: Container(
                                                width: 4.0,
                                                height: 4.0,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: (Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black)
                                                        .withOpacity(_current ==
                                                                entry.key
                                                            ? 0.9
                                                            : 0.4)),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: false,
                        disableCenter: true,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(double.infinity, 32),
                    backgroundColor: Colors.grey.shade900,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    });
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(double.infinity, 32),
                    backgroundColor: Colors.green.shade800,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SignInPage(),
                    //   ),
                    // );
                  },
                  child: const Text('Skip'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
