import 'package:flutter/material.dart';

class Post {
  final String title;
  final String author;
  final String content;
  final DateTime date;

  Post(
      {required this.title,
      required this.author,
      required this.content,
      required this.date});
}

final List<Post> posts = [
  Post(
    title: '¿Que es la Discromatopsia?',
    author: 'Cristian López',
    content:
        'La discromatopsia es un trastorno visual en el que una persona tiene dificultad para distinguir o percibir ciertos colores o toda la gama de colores. También se conoce como daltonismo, en referencia al científico John Dalton, quien fue uno de los primeros en describir este trastorno en su propia visión. La discromatopsia se debe a un problema en los conos, las células sensibles a la luz en la retina del ojo que nos permiten percibir los diferentes colores. Hay diferentes tipos de discromatopsia, incluyendo la protanopia (incapacidad para ver el rojo), deuteranopia (incapacidad para ver el verde) y tritanopia (incapacidad para ver el azul). La mayoría de las personas con discromatopsia nacen con ella, aunque también puede ser adquirida como resultado de ciertas enfermedades o lesiones oculares. Aunque no tiene cura, hay ciertas adaptaciones y técnicas que pueden ayudar a las personas con discromatopsia a manejar su condición en la vida cotidiana.',
    date: DateTime.now(),
  ),
  Post(
    title: 'Cómo crear una aplicación en Flutter',
    author: 'Jane Smith',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  // Añadir más entradas del blog aquí...
];

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return ListTile(
            title: Text(post.title),
            subtitle: Text('${post.author} - ${post.date}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogPostScreen(post: post),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BlogPostScreen extends StatelessWidget {
  final Post post;

  const BlogPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${post.author} - ${post.date}'),
            const SizedBox(height: 16),
            Text(post.content),
          ],
        ),
      ),
    );
  }
}

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 67, 130, 1.0),
        automaticallyImplyLeading: false,
        title: const Center(
            child: Image(
          image: AssetImage(
              'data/assets/images/background_images/perfect_vision.png'),
          height: 50,
          color: Colors.white,
        )),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      body: const BlogScreen(),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromRGBO(0, 67, 130, 1.0),
        primaryColor: Colors.white,
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 1, // Agrega esta línea
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Ajustes',
          )
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navegar a la pantalla de inicio
              Navigator.pushNamed(context, 'botones');
              break;
            case 1:
              // Navegar a la pantalla de blog
              Navigator.pushNamed(context, 'blog');
              break;
            case 2:
              // Cerrar sesión
              Navigator.pushNamed(context, 'settings');
              // Implementar lógica para cerrar sesión
              break;
          }
        },
      ),
    );
  }
}
