import 'package:flutter/material.dart';
import 'package:key_population_database/core/slideLeftTransitionAnimation.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_index.dart';

class OutreachNew extends StatefulWidget {
  const OutreachNew({super.key});

  @override
  State<OutreachNew> createState() => _OutreachNewState();
}

DateTime outreachDateSelectedValue = DateTime.now();

class _OutreachNewState extends State<OutreachNew> {
  var outreachSiteController;
  var pathwayController;
  var peerWorkerController;
  var keyPopController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Outreach"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text("Date : "),
                  IconButton(
                    onPressed: () async {
                      showDatePicker(
                          context: context,
                          initialDate: outreachDateSelectedValue,
                          firstDate: DateTime(2020).subtract(const Duration(days: 36500)),
                          lastDate: DateTime(2030)
                      ).then((value) {
                        setState(() {
                          outreachDateSelectedValue = value!;
                        });
                      });
                    },
                    icon: const Icon(Icons.calendar_month),
                    tooltip: "Pick a date",
                  ),
                  Text("${outreachDateSelectedValue.day}/${outreachDateSelectedValue.month}/${outreachDateSelectedValue.year}",
                      style: const TextStyle(
                          fontSize: 24
                      )),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: outreachSiteController,
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Site name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: pathwayController,
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Pathway",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: peerWorkerController,
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Peerworker",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: keyPopController,
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Client",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something";
                  }
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: const Center(
                    child: Column(
                      children: [
                        Text("add outreach and continue to add KPs reached", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(slideLeftTransitionAnimation(const OutreachIndex()));
                },
              ),
            ]
        ),
      ),
    );
  }
}
