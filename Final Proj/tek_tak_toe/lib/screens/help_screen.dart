import 'package:flutter/material.dart';
import 'package:tek_tak_toe/screens/help_screen.dart';
import 'package:tek_tak_toe/screens/onboarding.dart';
import 'difficulty_screen.dart';
import 'game_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Tic-Tac-Toe is a classic game where two players take turns marking spaces on a 3x3 grid. The first player to align three of their symbols in a row, column, or diagonal wins the game.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.purpleAccent, Colors.blueAccent],
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'HOW TO PLAY',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tap on an empty cell to place your symbol. Players alternate turns, with Player 1 using "X" and Player 2 using "O".',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.purpleAccent, Colors.blueAccent],
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'WINNING THE GAME',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'The game ends when one player aligns three symbols in a row, column, or diagonal.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}