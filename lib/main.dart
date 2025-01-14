import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'ocr_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  
  const MyApp({super.key, required this.camera});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OCRService(),
      child: MaterialApp(
        title: 'Document Recognition',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(camera: camera),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CameraDescription camera;
  final String title = 'Document Recognition';
  
  const MyHomePage({super.key, required this.camera});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ocrService = Provider.of<OCRService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async{
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();
                      await ocrService.processImage(image);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Capture Document'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Recognized Text:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  ocrService.recognizedText,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
