import 'package:flutter/material.dart';

class PopulationNewScreen extends StatefulWidget {
  const PopulationNewScreen({super.key});

  @override
  State<PopulationNewScreen> createState() => _PopulationNewScreenState();
}

class _PopulationNewScreenState extends State<PopulationNewScreen> {
  @override
  Widget build(BuildContext context) {
    var _firstName;
    var _lastName;
    var _selectedGender;
    var _otherGender;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Client"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("First Name: "),
              TextFormField(
                controller: _firstName,
              ),
              const SizedBox(height: 12),
              const Text("Last Name: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Gender: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Date of Birth: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Birth Order: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Left/Right handed? "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Risk Category: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("District: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
              const Text("Province: "),
              TextFormField(
                controller: _lastName,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      )
    );
  }
}
