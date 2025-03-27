import 'package:flutter/material.dart';
import 'package:gods_of_flutter/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/tech.json', height: 400),
                FittedBox(
                  child: Text(
                    'Aumente seu QI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Registrar');
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text('Get Started'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Entrar');
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
