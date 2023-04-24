import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RealidadAumentadaPage extends StatelessWidget {
  const RealidadAumentadaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoListScreen(),
    );
  }
}

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      "title": "Gold Vision",
      "description": "Progresivo Premium",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/gold_vison.mp4?alt=media&token=fafb3c2c-6457-473b-8439-5c1eec419537",
    },
    {
      "title": "Svet HD",
      "description": "Progresivo Premium",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/svet_hd.mp4?alt=media&token=cb15ede2-6dc5-444e-bdad-d59a5ad5264d",
    },
    {
      "title": "Royal Premium",
      "description": "Progresivo Premium",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/royal.mp4?alt=media&token=9da14b89-6030-4e80-b561-69973036ebe1",
    },
    {
      "title": "Professional",
      "description": "Progresivo Premium",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/profesional.mp4?alt=media&token=20ce91d8-a734-4058-961c-dffc6e4e0931",
    },
    {
      "title": "Smart Vision",
      "description": "Progresivo Intermedio",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/smart_vision.mp4?alt=media&token=a6b49953-bd55-4959-9ca1-3b9c94d34819",
    },
    {
      "title": "Initial",
      "description": "Progresivo Intermedio",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/initial.mp4?alt=media&token=6f7b6fdd-7ea3-432d-9384-dd661ea17d4f",
    },
    {
      "title": "Start Plus",
      "description": "Progresivo Basico",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/star_plus.mp4?alt=media&token=66f4a2af-5f5d-4ac8-8aaa-c8a27da00c79",
    },
    {
      "title": "V-Relax",
      "description": "Progresivo Basico",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/v_relax.mp4?alt=media&token=85161dd2-da8c-4e9c-9bee-2d1feed3bfd8",
    },
    {
      "title": "Basic Vision",
      "description": "Progresivo Basico",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/basic.mp4?alt=media&token=310b0bea-f9c5-4de6-bea7-5ad3f16b83fd",
    },
    {
      "title": "Ecuality Digital",
      "description": "Progresivo Basico",
      "videoUrl":
          "https://firebasestorage.googleapis.com/v0/b/perfect-vision-app.appspot.com/o/profesional.mp4?alt=media&token=20ce91d8-a734-4058-961c-dffc6e4e0931",
    },
  ];

  VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realidad Aumentada'),
        backgroundColor: const Color.fromRGBO(0, 67, 130, 1.0),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, 'botones');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => VideoPlayerScreen(
                    videoUrl: videos[index]["videoUrl"]!,
                    videoTitle: videos[index]["title"]!,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(
                videos[index]["title"]!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              subtitle: Text(videos[index]["description"]!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => VideoPlayerScreen(
                      videoUrl: videos[index]["videoUrl"]!,
                      videoTitle: videos[index]["title"]!,
                    ),
                  ),
                );
              },
            ), /*Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videos[index]["title"]!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  Text(videos[index]["description"]!),
                  const Divider()
                ],
              ),
            ),*/
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  const VideoPlayerScreen(
      {super.key, required this.videoUrl, required this.videoTitle});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  //bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        fullScreenByDefault: true,
        autoInitialize: true,
        autoPlay: true,
        showControls: true,
        aspectRatio: 16 / 9,
        placeholder: const Center(child: CircularProgressIndicator()),
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.blue,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightBlue,
        ));

    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Progresivos'),
        backgroundColor: const Color.fromRGBO(0, 67, 130, 1.0),
        actions: [
          IconButton(
            icon: const Icon(Icons.question_mark_rounded, size: 30),
            onPressed: () {
              _chewieController.pause();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                          '¿Tienes alguna pregunta con relación al video?'),
                      content: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'chat');
                          },
                          child: const Text('¡Preguntale a Prisma!')),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            _chewieController.play();
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 67, 130, 1.0))),
                          child: const Text('Cerrar'),
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(0, 67, 130, .50),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            /* child: Text(
              widget.videoTitle,
              style: const TextStyle(fontSize: 20.0),
            ),*/
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
