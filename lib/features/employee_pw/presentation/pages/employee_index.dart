import 'package:flutter/material.dart';
import 'package:key_population_database/core/slideLeftTransitionAnimation.dart';
import 'package:key_population_database/features/employee_pw/presentation/pages/employee_new.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_new.dart';

class EmployeeIndex extends StatefulWidget {
  const EmployeeIndex({super.key});

  @override
  State<EmployeeIndex> createState() => _EmployeeIndexState();
}

class _EmployeeIndexState extends State<EmployeeIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text("Employees will be listed here."),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "new employee PW",
        onPressed: () {
          Navigator.of(context).push(slideLeftTransitionAnimation(const EmployeeNew()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
