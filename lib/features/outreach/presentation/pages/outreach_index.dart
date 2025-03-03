import 'package:flutter/material.dart';
import 'package:key_population_database/core/slideLeftTransitionAnimation.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_new.dart';

class OutreachIndex extends StatefulWidget {
  const OutreachIndex({super.key});

  @override
  State<OutreachIndex> createState() => _OutreachIndexState();
}

class _OutreachIndexState extends State<OutreachIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outreach Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Column(
        children: [
          Center(
            child: Text("list all Outreach data here."),
          ),
          SizedBox(height: 16,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "new outreach",
        onPressed: () {
          Navigator.of(context).push(slideLeftTransitionAnimation(const OutreachNew()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
