import 'package:flutter/material.dart';
import 'success_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String name; // Add a variable to hold the name

  WelcomeScreen({required this.name}); // Constructor to accept name

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Form key and controllers to capture form data
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( // Makes the page scrollable for small screens
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Form key for validation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the name passed from HomeScreen
                Text(
                  'Welcome, ${widget.name}!', // Use widget.name to display the name
                  style: TextStyle(
                    fontSize: 26, // Reduced font size for mobile
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),

                // Address Field
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Age Field
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Hobbies Field
                TextFormField(
                  controller: _hobbiesController,
                  decoration: InputDecoration(labelText: 'Hobbies'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your hobbies';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Blood Type Field
                TextFormField(
                  controller: _bloodTypeController,
                  decoration: InputDecoration(labelText: 'Blood Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your blood type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Height Field
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Weight Field
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the success screen if form is valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(fontSize: 16),
                    ),
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
