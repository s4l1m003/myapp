import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  final String name;

  WelcomeScreen({required this.name});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Scrollable view to handle small screens
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Reduced padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome title in large size
              Text(
                'Welcome, it\'s nice to see you!',
                style: TextStyle(
                  fontSize: 26, // Reduced font size
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30), // Reduced spacing
              // Personalized name text
              Text(
                'Welcome, ${widget.name}!',
                style: TextStyle(
                  fontSize: 22, // Slightly reduced font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25), // Reduced spacing

              // Form for detailed bio-data
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address Field
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(fontSize: 14), // Smaller label
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10), // Smaller spacing between fields
                    // Age Field
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || int.tryParse(value) == null) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Hobbies Field
                    TextFormField(
                      controller: _hobbiesController,
                      decoration: InputDecoration(
                        labelText: 'Hobbies',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your hobbies';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Blood Type Field
                    TextFormField(
                      controller: _bloodTypeController,
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your blood type';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Height Field
                    TextFormField(
                      controller: _heightController,
                      decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || int.tryParse(value) == null) {
                          return 'Please enter a valid height';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Weight Field
                    TextFormField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || int.tryParse(value) == null) {
                          return 'Please enter a valid weight';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Nickname Field
                    TextFormField(
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        labelText: 'Nickname',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your nickname';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Submit Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Bio-data submitted successfully!'),
                              ),
                            );
                          }
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10), // Adjust button size
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
