import 'dart:async';
import 'package:flutter/material.dart';
import 'track_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 8), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TrackOne()),
      );
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 62, 65),
      body: Stack(
        children: [
          // Configs da logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 220.0), // Ajuste da posição da logo
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          // Textos centrais
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  'Recifência',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                      letterSpacing: 2.0,
                      fontFamily: 'Kavoon'),
                ),
                SizedBox(height: 20),
                Text(
                  'A arte de Recife na palma da sua mão',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
