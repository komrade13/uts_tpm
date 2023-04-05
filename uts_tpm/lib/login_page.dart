import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isValid = true;

  void _validateInputs() {
    setState(() {
      if (_usernameController.text != "123200094" ||
          _passwordController.text != "Alfa") {
        _isValid = false;
      } else {
        _isValid = true;
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: _validateInputs,
            ),
            SizedBox(height: 16.0),
            !_isValid
                ? Text(
              'Invalid Username or Password',
              style: TextStyle(color: Colors.red),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}