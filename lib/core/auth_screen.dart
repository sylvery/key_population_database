import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:key_population_database/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  String _verificationId = "";

  // Google Sign-In
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> _verifyPhoneNumber() async {
    final String phoneNumber = "+675${_phoneNumberController.text}";

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          // Navigate to the next screen or perform necessary actions.
          navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const KPHome(title: "Community Outreach Testing Home")));
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          // Handle other verification errors.
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-retrieval timeout, handle if needed.
        },
      );
    } catch (e) {
      print('Error sending verification code: $e');
    }
  }

  Future<void> _signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsCodeController.text,
      );
      await _auth.signInWithCredential(credential);
      navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const KPHome(title: "KPDB Home")));
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
        // Navigate to the next screen or perform necessary actions.
        navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => const KPHome(title: "Loan Shark Home")));
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text('Send Verification Code (Phone)'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _smsCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'SMS Code'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: const Text('Verify SMS Code (Phone)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}