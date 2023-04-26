import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PresbiciaPage extends StatefulWidget {
  const PresbiciaPage({Key? key}) : super(key: key);

  @override
  _PresbiciaPageState createState() => _PresbiciaPageState();
}

class _PresbiciaPageState extends State<PresbiciaPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture =
      Future<void>.delayed(Duration.zero);
  ImageFilter? _imageFilter;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _imageFilter =
        ImageFilter.matrix(Float64List.fromList(Matrix4.identity().storage));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _controller = CameraController(camera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Builder(builder: (context) {
                  if (_controller.value.isInitialized) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
                if (_imageFilter != null)
                  Positioned.fill(
                    child: ImageFiltered(
                      imageFilter: _imageFilter!,
                      child: CameraPreview(_controller),
                    ),
                  ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleFilter,
        child: const Icon(Icons.blur_on),
      ),
    );
  }

  void _toggleFilter() async {
    await _initializeControllerFuture;
    if (_imageFilter == null) {
      final matrix = Matrix4(
        5.0,
        0.0,
        0.0,
        0.0,
        0.0,
        5.0,
        0.0,
        0.0,
        0.0,
        0.0,
        5.0,
        0.0,
        0.0,
        0.0,
        0.0,
        5.0,
      );
      _imageFilter = ImageFilter.matrix(Float64List.fromList(matrix.storage));
    } else {
      _imageFilter = null;
    }
    setState(() {});
  }
}
