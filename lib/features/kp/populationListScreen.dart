import 'package:flutter/material.dart';

class PopulationListScreen extends StatefulWidget {
  const PopulationListScreen({super.key});

  @override
  State<PopulationListScreen> createState() => _PopulationListScreenState();
}

class _PopulationListScreenState extends State<PopulationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Population"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          children: [
            Text("List Registered Key Populations Here"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newKeyPopulation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _newKeyPopulation() {
    Navigator.of(context).pushNamed('/kp/new');
  }
}
