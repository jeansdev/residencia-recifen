import 'package:flutter/material.dart';

class ArtistPageTwo extends StatefulWidget {
  @override
  _ArtistPageTwoState createState() => _ArtistPageTwoState();
}

class _ArtistPageTwoState extends State<ArtistPageTwo> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFCB2A2D)),
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
                      'assets/artista2.jpg', // Atualize com o caminho da imagem de Laís Souza
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
                        "Alisson Lourenço - Artista",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Color(0xFFCB2A2D) : Colors.grey,
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
                      Icon(Icons.place, color: Color(0xFFCB2A2D), size: 20),
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
                      "Alisson Lourenço é um artista visual pernambucano conhecido por suas obras de arte que exploram temas da cultura nordestina e racial. Suas obras são caracterizadas pela quebra de expectativa de quem visualiza a arte."),
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
                      "Exposição Cultural - Arte Racial, 2024",
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
