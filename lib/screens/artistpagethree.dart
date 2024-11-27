import 'package:flutter/material.dart';

class ArtistPageThree extends StatefulWidget {
  @override
  _ArtistPageThreeState createState() => _ArtistPageThreeState();
}

class _ArtistPageThreeState extends State<ArtistPageThree> {
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
                      'assets/artista3.png', // Atualize com o caminho da imagem de Laís Souza
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
                        "Paulinho Santos - Cantor",
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
                    "Sobre o Artista:",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                      "Com 20 anos, pernambucano que estourou com covers nas redes se lança num sólido disco quase todo autoral e cercado de medalhões."),
                  SizedBox(height: 16),
                  Text(
                    "Shows recentes:",
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
                      "Rec'n'Play Festival - 2024",
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
