import 'package:flutter/material.dart';
import 'package:key_population_database/core/slideLeftTransitionAnimation.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_index.dart';

class EmployeeNew extends StatefulWidget {
  const EmployeeNew({super.key});

  @override
  State<EmployeeNew> createState() => _EmployeeNewState();
}

final List<String> employeeRoleTypes = ['FSO', 'PW', 'PE', 'CFO', 'CFFW'];
DateTime dobDateSelectedValue = DateTime.now();
DateTime startDateSelectedValue = DateTime.now();
DateTime endDateSelectedValue = DateTime.now();

class _EmployeeNewState extends State<EmployeeNew> {
  String employeeRoleTypeRadioValue = employeeRoleTypes[1];
  var _pWCodeController;
  var _lastNameController;
  var _firstNameController;
  var _genderController;
  var _phoneNumberController;
  var _primaryTargetKPController;
  var _activeBeneficiaryController;
  var _commentsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Employee"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: _pWCodeController,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Peer Worker/Employee Code",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _firstNameController,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "First Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _lastNameController,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Last Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            const Text("Employee Role Category"),
            RadioListTile(
              title: const Text("FSO"),
              value: employeeRoleTypes[0],
              groupValue: employeeRoleTypeRadioValue,
              onChanged: (value) {
                setState(() {
                  employeeRoleTypeRadioValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("PW"),
              value: employeeRoleTypes[1],
              groupValue: employeeRoleTypeRadioValue,
              onChanged: (value) {
                setState(() {
                  employeeRoleTypeRadioValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("PE"),
              value: employeeRoleTypes[2],
              groupValue: employeeRoleTypeRadioValue,
              onChanged: (value) {
                setState(() {
                  employeeRoleTypeRadioValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("CFO"),
              value: employeeRoleTypes[3],
              groupValue: employeeRoleTypeRadioValue,
              onChanged: (value) {
                setState(() {
                  employeeRoleTypeRadioValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("CFFW"),
              value: employeeRoleTypes[4],
              groupValue: employeeRoleTypeRadioValue,
              onChanged: (value) {
                setState(() {
                  employeeRoleTypeRadioValue = value.toString();
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text("D.O.B.: "),
                IconButton(
                  onPressed: () async {
                    showDatePicker(
                        context: context,
                        initialDate: dobDateSelectedValue,
                        firstDate: DateTime(2020).subtract(const Duration(days: 36500)),
                        lastDate: DateTime(2024)
                    ).then((value) {
                      setState(() {
                        dobDateSelectedValue = value!;
                      });
                    });
                  },
                  icon: const Icon(Icons.calendar_month),
                  tooltip: "Choose date",
                ),
                Text("${dobDateSelectedValue.day}/${dobDateSelectedValue.month}/${dobDateSelectedValue.year}",
                    style: const TextStyle(
                        fontSize: 24
                    )),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _genderController,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Gender",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Phone number",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _primaryTargetKPController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Primary Target KP",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _activeBeneficiaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Active Beneficiary",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter something";
                }
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text("Start date: "),
                IconButton(
                  onPressed: () async {
                    showDatePicker(
                        context: context,
                        initialDate: startDateSelectedValue,
                        firstDate: DateTime(2020).subtract(const Duration(days: 36500)),
                        lastDate: DateTime(2024)
                    ).then((value) {
                      setState(() {
                        startDateSelectedValue = value!;
                      });
                    });
                  },
                  icon: const Icon(Icons.calendar_month),
                  tooltip: "Choose date",
                ),
                Text("${startDateSelectedValue.day}/${startDateSelectedValue.month}/${startDateSelectedValue.year}",
                    style: const TextStyle(
                        fontSize: 24
                    )),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text("End date: "),
                IconButton(
                  onPressed: () async {
                    showDatePicker(
                        context: context,
                        initialDate: endDateSelectedValue,
                        firstDate: DateTime(2020).subtract(const Duration(days: 36500)),
                        lastDate: DateTime(2024)
                    ).then((value) {
                      setState(() {
                        endDateSelectedValue = value!;
                      });
                    });
                  },
                  icon: const Icon(Icons.calendar_month),
                  tooltip: "Choose date",
                ),
                Text("${endDateSelectedValue.day}/${endDateSelectedValue.month}/${endDateSelectedValue.year}",
                    style: const TextStyle(
                        fontSize: 24
                    )),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _commentsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Comments",
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
                      Text("add employee", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  )),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const OutreachIndex()));
              },
            ),
          ]
        ),
      ),
    );
  }
}
