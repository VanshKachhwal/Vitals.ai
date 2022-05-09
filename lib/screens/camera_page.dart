import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:vitals_ai/screens/video_page.dart';
import 'package:vitals_ai/utils/routes.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  bool _isLoading = true;
  bool _isRecording = true;
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
    await _cameraController.prepareForVideoRecording();
    await _cameraController.startVideoRecording();
    _recordVideo();
  }

  _recordVideo() async {
    await Future.delayed(Duration(seconds: 5));
    if(_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
      // final route = MaterialPageRoute(
      //   fullscreenDialog: true,
      //   builder: (_) => VideoPage(filePath: file.path)
      // );
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }else {
      
    }
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