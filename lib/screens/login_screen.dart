import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/home.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Implement login logic here
    String username = emailController.text;
    String password = passwordController.text;

    // You can add your own logic to validate the login credentials
    if (username == 'flutter' && password == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _register(BuildContext context) {
    // Implement registration logic here
    // You can store the registered user data in a database or perform any other necessary actions
    String username2 = emailController.text;
    String password2 = passwordController.text;

    // Show a dialog to indicate successful registration
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You have successfully registered.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('data:image/jpeg;base64,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'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CAT MOBILE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 32.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    _login(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {
                    _register(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}