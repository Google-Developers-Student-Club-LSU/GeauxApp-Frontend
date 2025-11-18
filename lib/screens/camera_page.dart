import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'new_post_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CameraPage(cameras: cameras),
    );
  }
}

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  
  @override
  void initState() {
    super.initState();

    if(widget.cameras.isEmpty) {
      print("No cameras available!");
      return;
    }

    final firstCamera = widget.cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high, enableAudio: false);
    _initializeControllerFuture = _controller?.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildCameraPreview() {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    if (scale < 1) scale = 1/scale;

    return Transform.scale(
      scale: scale,
      alignment: Alignment.center,
      child: CameraPreview(_controller!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          //Camera view
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _buildCameraPreview();
              } else {
                return Container(
                  color: Colors.black,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
          
          //Gallery button
          Positioned(
            left: 25,
            bottom: 39,
            child: SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  padding: EdgeInsets.all(0),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.photo_library_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                  size: 28,
                ),
              ),
            ),
          ),
          
          //Shutter button
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primaryContainer.withAlpha(191),
                  shape: CircleBorder(),
                  side: BorderSide(color: theme.colorScheme.onPrimaryContainer),
                  maximumSize: Size(84, 84)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPostConfirmScreen()),
                  );
                },
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}