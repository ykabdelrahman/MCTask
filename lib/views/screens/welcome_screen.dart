import 'package:flutter/material.dart';
import 'package:mctask/views/screens/signup_screen.dart';
import '../../constants.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(),
            //        welcome text
            const Text(
              'Welcome to Happy Walking store',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 26,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            //         image
            const Image(
              image: AssetImage('assets/images/logoo.jpeg'),
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 50),
            //      login button
            CustomButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              height: 50,
              width: MediaQuery.of(context).size.width * .8,
              backgroundColor: kPrimaryColor,
              borderRadius: BorderRadius.circular(6),
              splashColor: Colors.purple,
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //      signup button
            CustomButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
              },
              height: 50,
              width: MediaQuery.of(context).size.width * .8,
              backgroundColor: kPrimaryColor,
              borderRadius: BorderRadius.circular(6),
              splashColor: Colors.purple,
              child: const Text(
                'SIGNUP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
