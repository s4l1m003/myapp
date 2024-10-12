import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to check if the email already exists in storage
  Future<bool> checkEmailExists(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(email) != null; // Check if email already stored
  }

  // Function to store user details in SharedPreferences
  Future<void> saveUserData(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(email, password); // Store email and password
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Big title "First time?"
              Text(
                'First time?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Name Input Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 10),

              // Email Input Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 14),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),

              // Password Input Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 14),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),

              // "Sign Up" Button
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Check if the email already exists
                  if (await checkEmailExists(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email has already been used!')),
                    );
                  } else {
                    // Save the email and password, and navigate to Welcome Screen
                    await saveUserData(email, password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WelcomeScreen(name: _nameController.text),
                      ),
                    );
                  }
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // "Login" Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
