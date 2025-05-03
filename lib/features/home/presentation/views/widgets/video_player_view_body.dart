import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/app_color.dart';
import 'custom_app_bar.dart';

class VideoPlayerViewBody extends StatefulWidget {
  const VideoPlayerViewBody({super.key, required this.url});

  final String url;

  @override
  State<VideoPlayerViewBody> createState() => _VideoPlayerViewBodyState();
}

class _VideoPlayerViewBodyState extends State<VideoPlayerViewBody> {
  late VideoPlayerController _controller;
  bool _isControlsVisible = true;
  bool _isFullScreen = false;
  late double _videoProgress = 0.0;
  late double _totalDuration =
      1.0; // Total video duration for progress tracking

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          _totalDuration = _controller.value.duration.inSeconds.toDouble();
        });
      });
    _controller.addListener(_updateProgress);
  }

  void _updateProgress() {
    setState(() {
      _videoProgress = _controller.value.position.inSeconds.toDouble();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_updateProgress);
    _controller.dispose();
  }

  void _toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    if (_isFullScreen) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: "مشاهدة الفيديو"),
        const SizedBox(height: 15),
        Expanded(
          child: GestureDetector(
            onTap: _toggleControls, // Toggle controls on tap
            child: Stack(
              children: [
                Center(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const CircularProgressIndicator(
                          color: AppColor.kPrimaryColor,
                        ),
                ),
                if (_isControlsVisible) ...[
                  // Control Overlay
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // Play/Pause button
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                          ),
                          // Progress bar
                          Expanded(
                            child: Slider(
                              value: _videoProgress,
                              min: 0,
                              max: _totalDuration,
                              onChanged: (double value) {
                                setState(() {
                                  _videoProgress = value;
                                  _controller
                                      .seekTo(Duration(seconds: value.toInt()));
                                });
                              },
                              activeColor: Colors.redAccent,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                          // Full-screen button
                          IconButton(
                            icon: Icon(
                              _isFullScreen
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: _toggleFullScreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class VideoPlayerScreen extends StatefulWidget {
//   final String url;
//
//   const VideoPlayerScreen({super.key, required this.url});
//
//   @override
//   VideoPlayerScreenState createState() => VideoPlayerScreenState();
// }
//
// class VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('مشاهدة الفيديو'),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : const CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
