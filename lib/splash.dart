import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetologin();
  }

  navigatetologin() async {
    await Future.delayed(
      const Duration(milliseconds: 5000),
      () {},
    );
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                child: Lottie.asset('animations/todo.json'),
              ),
              Text(
                "CheckIt Off",
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
