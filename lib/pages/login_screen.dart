import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'forgot_password.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isButtonEnabled = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool _isInputValid() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validate email
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    final isEmailValid = emailRegex.hasMatch(email);

    // Validate password
    final isPasswordValid = password.length >= 6;

    return isEmailValid && isPasswordValid;
  }

  Future<void> _handleSignIn(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Please wait..."),
              SizedBox(height: 16.0),
              LinearProgressIndicator(),
            ],
          ),
        );
      },
    );

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        FocusScope.of(context).unfocus();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid username and password combination';
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final logoSize = mediaQuery.size.width * 0.4;
    final buttonWidth = mediaQuery.size.width * 0.4;

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_text.png',
                    width: 250,
                    height: 50,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.04),
                  EmailTextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onChanged: (value) {
                      setState(() {
                        _isButtonEnabled = _isInputValid();
                      });
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.02),
                  PasswordTextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    isPasswordVisible: _isPasswordVisible,
                    togglePasswordVisibility: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _isButtonEnabled = _isInputValid();
                      });
                    },
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Opacity(
                        opacity: _isLoading || !_isButtonEnabled ? 0.5 : 1.0,
                        child: ElevatedButton(
                          onPressed: _isLoading || !_isButtonEnabled
                              ? null
                              : () {
                                  _emailFocusNode.unfocus();
                                  _passwordFocusNode.unfocus();
                                  _handleSignIn(context);
                                },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(buttonWidth, 50),
                          ),
                        ),
                      ),
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const EmailTextField({
    required this.controller,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const PasswordTextField({
    required this.controller,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: onChanged,
          focusNode: focusNode,
        ),
        Positioned(
          right: 12.0,
          child: InkWell(
            onTap: togglePasswordVisibility,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(isPasswordVisible ? 0.3 : 0.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey.withOpacity(0.7),
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
