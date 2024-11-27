import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
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
                      'assets/artista1.jpg', // Atualize com o caminho da imagem de Laís Souza
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
                  // Colocando o nome da artista e o ícone de favorito dentro de um Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Laís Souza - Artista Plástica",
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
                      Text("Recife, PE"),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share, color: const Color(0xFFCB2A2D)),
                    label: Text(
                      "Compartilhar",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: const Color(0xFFCB2A2D)),
                    ),
                    style: ElevatedButton.styleFrom(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Sobre a Artista:",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                      "Laís Souza é uma artista plástica pernambucana conhecida por suas obras de arte que exploram temas da cultura nordestina. Suas obras são caracterizadas pelo uso de cores vibrantes e formas que evocam a riqueza cultural da região."),
                  SizedBox(height: 16),
                  Text(
                    "Exposições Recentes:",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Código para navegar para a página de uma exposição específica
                    },
                    child: Text(
                      "Exposição Cultural - Arte e Tradição, 2024",
                      style:
                          TextStyle(color: Colors.blue, fontFamily: 'Poppins'),
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
