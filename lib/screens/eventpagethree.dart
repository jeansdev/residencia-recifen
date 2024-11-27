import 'package:flutter/material.dart';

class EventPageThree extends StatefulWidget {
  @override
  _EventPageThreeState createState() => _EventPageThreeState();
}

class _EventPageThreeState extends State<EventPageThree> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey.shade300, // Placeholder da imagem
                  child: Center(
                    child: Image.asset(
                      'assets/dash.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colocando a frase e o ícone dentro de um Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Para distribuir bem os elementos
                    children: [
                      Text(
                        "Conecta+ Pedro Dash",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorited = !isFavorited;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.red, size: 20),
                      SizedBox(width: 4),
                      Text("Palco Recife Cidade da Música, Recife Antigo"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.red, size: 20),
                      SizedBox(width: 4),
                      Text("07 de novembro de 2024"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.red, size: 20),
                      SizedBox(width: 4),
                      Text("20h"),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share, color: const Color(0xFFCB2A2D)),
                    label: Text(
                      "Compartilhar",
                      style: TextStyle(color: const Color(0xFFCB2A2D)),
                    ),
                    style: ElevatedButton.styleFrom(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Descrição do evento:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                      "O cantor Dash também vai estar presente no maior festival gratuito de tecnologia, inovação e cultura do Brasil."),
                  SizedBox(height: 16),
                  Text(
                    "Ingressos:",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Acesse os ingressos clicando aqui.",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
