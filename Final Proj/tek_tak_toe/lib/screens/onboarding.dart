import 'package:flutter/material.dart';
import 'package:tek_tak_toe/screens/help_screen.dart';
import 'package:tek_tak_toe/screens/onboarding.dart';
import 'game_mode_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingPages = [
    {
      "title": "Tic Tac Toe",
      "description": "The classic game of strategy and skill.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Tic Tac Toe!",
      "description": "Challenge yourself or a friend to a battle of wits",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Tic Tac Toe!",
      "description": "Get ready to outsmart your opponent!",
      "image": "assets/images/onboarding3.png",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.6,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          onboardingPages[index]['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent],
                        ).createShader(bounds);
                      },
                      child: Text(
                        onboardingPages[index]['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onboardingPages[index]['description'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blueAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage < 2)
                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameModeScreen(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == 2 ? 'START' : 'NEXT',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
