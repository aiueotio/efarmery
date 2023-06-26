import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eFarmery'),
      ),
      body: Center(
        child: Text(
          'Welcome to eFarmery!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navigate to the home screen
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Navigate to the profile screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
