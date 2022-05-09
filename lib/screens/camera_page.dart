import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  bool _isLoading = true;
  late CameraController _cameraController;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
  
  @override
  void initState() {
    super.initState();
    _initCamera();
  }
  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return CameraPreview(_cameraController);
    }
  }
}