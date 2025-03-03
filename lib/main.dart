import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:key_population_database/core/slideLeftTransitionAnimation.dart';
import 'package:key_population_database/features/employee_pw/presentation/pages/employee_index.dart';
import 'package:key_population_database/features/employee_pw/presentation/pages/employee_new.dart';
import 'package:key_population_database/features/kp/populationListScreen.dart';
import 'package:key_population_database/features/kp/populationNewScreen.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_index.dart';
import 'package:key_population_database/features/outreach/presentation/pages/outreach_new.dart';
import 'package:key_population_database/firebase_options.dart';

import 'core/auth_screen.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  // Run your app
  runApp(const KPDBApp());
}
User? user = FirebaseAuth.instance.currentUser;
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class KPDBApp extends StatelessWidget {
  const KPDBApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      title: 'Community Testing Outreach',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange.shade900),
        useMaterial3: true,
      ),
      home: user != null ? const KPHome(title: 'Community Testing Outreach') : AuthScreen(),
      // home: user != null ? const KPHome(title: "KPDB Home") : AuthScreen(),
      routes: {
        '/kp/new': (context) => const PopulationNewScreen(),
      },
    );
  }
}

class KPHome extends StatefulWidget {
  const KPHome({super.key, required this.title});
  final String title;

  @override
  State<KPHome> createState() => _KPHomeState();
}

class _KPHomeState extends State<KPHome> {
  @override
  Widget build(BuildContext context) {
    var bottomNavSelectedItemIndex = 0;
    void _onBottomNavItemTapped(int index) {
      switch(index) {
        case 0:
          break;
        case 1:
          setState((){
            bottomNavSelectedItemIndex = 1;
          });
          Navigator.of(context).push(slideLeftTransitionAnimation(const PopulationListScreen()));
          break;
        case 2:
          setState((){
            bottomNavSelectedItemIndex = 2;
          });
          Navigator.pushNamed(context, '/unpaid-expenses');
          break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Center(
                  child: Column(
                    children: [
                      Text("Outreach", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                    ],
                  )),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const OutreachIndex()));
              },
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              child: const Center(
                  child: Column(
                    children: [
                      Text("Registered KPs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                    ],
                  )),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const PopulationListScreen()));
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Center(
                child: Column(
                  children: [
                    Text("Peer Workers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const EmployeeIndex()));
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Center(
                child: Column(
                  children: [
                    Text("New Employee", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const EmployeeNew()));
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Center(
                child: Column(
                  children: [
                    Text("New Client", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const PopulationNewScreen()));
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Center(
                child: Column(
                  children: [
                    Text("New Outreach", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(slideLeftTransitionAnimation(const OutreachNew()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "KPs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
        ],
        currentIndex: bottomNavSelectedItemIndex,
        onTap: _onBottomNavItemTapped,
      ),
    );
  }
}
