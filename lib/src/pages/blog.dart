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

List<Post> posts = [
  Post(
    title: '¿Que es la Discromatopsia?',
    author: 'Cristian López',
    content:
        'La discromatopsia es un trastorno visual en el que una persona tiene dificultad para distinguir o percibir ciertos colores o toda la gama de colores. También se conoce como daltonismo, en referencia al científico John Dalton, quien fue uno de los primeros en describir este trastorno en su propia visión. La discromatopsia se debe a un problema en los conos, las células sensibles a la luz en la retina del ojo que nos permiten percibir los diferentes colores. Hay diferentes tipos de discromatopsia, incluyendo la protanopia (incapacidad para ver el rojo), deuteranopia (incapacidad para ver el verde) y tritanopia (incapacidad para ver el azul). La mayoría de las personas con discromatopsia nacen con ella, aunque también puede ser adquirida como resultado de ciertas enfermedades o lesiones oculares. Aunque no tiene cura, hay ciertas adaptaciones y técnicas que pueden ayudar a las personas con discromatopsia a manejar su condición en la vida cotidiana.',
    date: DateTime.now(),
  ),
  Post(
    title: 'Como hacer el test de Ishihara',
    author: 'Paola López',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  Post(
    title: '¿Qué es el policarbonato?',
    author: 'Manuel Perez',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  Post(
    title: '¿Qué es un lente progresivo?',
    author: 'Jose Luis',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  Post(
    title: 'Fundamentos de la Optometria',
    author: 'Karla Morales',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  Post(
    title: 'La importancia de limpiar tus lentes',
    author: 'Luis Castro',
    content: 'Para crear una aplicación en Flutter, primero debes...',
    date: DateTime.now(),
    //date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
  ),
  // Añadir más entradas del blog aquí...
];

class BlogScreen extends StatefulWidget {
  BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // put the action you want here
                print("Button pressed");
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add new post'),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Post title'),
                    ),
                    TextFormField(
                      controller: _authorController,
                      decoration: InputDecoration(hintText: 'Author name'),
                    ),
                    TextFormField(
                      controller: _contentController,
                      decoration: InputDecoration(hintText: 'Content'),
                    ),
                    // Add more TextFormFields for additional data as needed.
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {

                      String postTitle = _titleController.text;
                      String authorName = _authorController.text;
                      String content1 = _contentController.text;

                      _titleController.clear();
                      _authorController.clear();
                      _contentController.clear();

                      posts.add(Post(
                        title: postTitle,
                        author: authorName,
                        content: content1,
                        date: DateTime.now()
                      )); // Add the post to the list.
                    },
                  ),
                ],
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

  const BlogPostScreen({Key? key, required this.post}) : super(key: key);

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
            Expanded(child: Text(post.content)), // Wrap with Expanded to avoid overflow
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Aligns the icons with equal space in the middle
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement your Edit functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement your Delete functionality here
              },
            ),
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
        backgroundColor: const Color.fromRGBO(82, 147, 206, 1.0),
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
      body:  BlogScreen(),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromRGBO(82, 147, 206, 1.0),
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
            label: 'Blog Informativo',
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
