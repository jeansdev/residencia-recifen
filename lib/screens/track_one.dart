import 'package:flutter/material.dart';
import 'track_two.dart';

class TrackOne extends StatelessWidget {
  const TrackOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Configs da logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),

          // Conteúdo centralizado
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 55),
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFCB2A2D),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Você já passou pela dificuldade de localizar artistas locais?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFCB2A2D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Artistas Visuais, Cantores ou Atores da nossa cidade sentem a ausência de holofotes para divulgar seus trabalhos. Já os consumidores, não sabem onde encontrar o que procuram.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              // Usando PageRouteBuilder para adicionar animação
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds:
                                          500), // Aumenta a duração para 500 ms (0.5 segundos)
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const TrackTwo();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin =
                                        Offset(1.0, 0.0); // Começa da direita
                                    const end = Offset
                                        .zero; // Termina na posição original
                                    const curve =
                                        Curves.easeInOut; // Animação suave

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                        position: offsetAnimation,
                                        child: child);
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCB2A2D),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(16),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
