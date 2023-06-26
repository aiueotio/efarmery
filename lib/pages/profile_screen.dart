import 'package:efamery_application/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ProfileScreen());

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/lele.png'),
              ),
              SizedBox(height: 16.0),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
