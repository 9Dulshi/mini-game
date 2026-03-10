import 'package:flutter/material.dart';
import 'dart:math'; 

void main() {
  runApp(const RockPaperScissorsGame());
}

class RockPaperScissorsGame extends StatelessWidget {
  const RockPaperScissorsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  
  final List<String> _choices = ['Rock', 'Paper', 'Scissors'];

  String _userChoice = "";
  String _computerChoice = "";
  String _resultText = "Make your move!";
  int _userScore = 0;
  int _computerScore = 0;

  
  void _playGame(String userSelection) {
    setState(() {
      _userChoice = userSelection;
      
      
      _computerChoice = _choices[Random().nextInt(3)];

      if (_userChoice == _computerChoice) {
        _resultText = "Draw"; 
      } else if (
          (_userChoice == 'Rock' && _computerChoice == 'Scissors') ||
          (_userChoice == 'Paper' && _computerChoice == 'Rock') ||
          (_userChoice == 'Scissors' && _computerChoice == 'Paper')) {
        _resultText = "You Win!"; 
        _userScore++;
      } else {
        _resultText = "Computer Wins!"; 
        _computerScore++;
      }
    });
  }

  
  void _resetGame() {
    setState(() {
      _userChoice = "";
      _computerChoice = "";
      _userScore = 0;
      _computerScore = 0;
      _resultText = "Game Reset. Make your move!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissors", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text("Score", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text("You: $_userScore", style: const TextStyle(fontSize: 18)),
            Text("Computer: $_computerScore", style: const TextStyle(fontSize: 18)),
            
            const SizedBox(height: 50),

            
            Text("Your Choice: $_userChoice", style: const TextStyle(fontSize: 16)),
            Text("Computer Choice: $_computerChoice", style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 80),

          
            Text(
              _resultText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 80),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChoiceButton("Rock"), 
                _buildChoiceButton("Paper"),
                _buildChoiceButton("Scissors"),
              ],
            ),

            const SizedBox(height: 60),

            
            ElevatedButton(
              onPressed: _resetGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text("Reset Game", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildChoiceButton(String choice) {
    return ElevatedButton(
      onPressed: () => _playGame(choice),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(choice, style: const TextStyle(color: Colors.white)),
    );
  }
}