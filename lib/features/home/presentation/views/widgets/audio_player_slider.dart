import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../core/utils/app_color.dart';

class AudioPlayerSlider extends StatefulWidget {
  const AudioPlayerSlider({super.key, required this.url});
  final String url;

  @override
  State<AudioPlayerSlider> createState() => _AudioPlayerSliderState();
}

class _AudioPlayerSliderState extends State<AudioPlayerSlider> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  String _formatDuration(Duration d) {
    final int hours = d.inHours.remainder(60);
    final int minutes = d.inMinutes.remainder(60);
    final int secs = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
  }

  void handlePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void handleSeek(double value) {
    _audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.setUrl(widget.url);
    _audioPlayer.positionStream.listen((p) {
      if (mounted) {
        setState(() {
          position = p;
        });
      }
    });
    _audioPlayer.durationStream.listen((d) {
      if (mounted) {
        setState(() {
          duration = d!;
        });
      }
    });
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (mounted) {
          setState(() {
            position = Duration.zero;
          });
        }
        _audioPlayer.pause();
        _audioPlayer.seek(position);
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_formatDuration(position)),
        Slider(
          activeColor: AppColor.kPrimaryColor,
          inactiveColor: AppColor.kGrayTextColor.withOpacity(.4),
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (value) {
            if (mounted) {
              setState(() {
                position = Duration(seconds: value.toInt());
              });
              handleSeek(value);
            }
          },
        ),
        Text(_formatDuration(duration)),
        const SizedBox(height: 10),
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColor.kPrimaryColor),
            padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
          ),
          icon: Icon(
            _audioPlayer.playing ? Icons.pause : Icons.play_arrow,
            color: Colors.white, // Icon color
            size: 30,
          ),
          onPressed: handlePlayPause,
        )
      ],
    );
  }
}

//
// void _playAudio(String url, int index) async {
//   try {
//     // If the new audio is clicked, stop the current audio and play the new one
//     if (_currentlyPlayingIndex != index) {
//       await _audioPlayer.setUrl(url);
//       await _audioPlayer.play();
//       setState(() {
//         _currentlyPlayingIndex = index;
//         _isPlaying = true;
//       });
//
//       // Update the total duration when the audio starts
//       _totalDuration = _audioPlayer.duration?.inSeconds.toDouble() ?? 1.0;
//
//       // Listen for position changes while playing
//       _audioPlayer.positionStream.listen((position) {
//         setState(() {
//           _currentPosition = position.inSeconds.toDouble();
//         });
//       });
//     } else {
//       // If the same audio is clicked, toggle play/pause
//       if (_isPlaying) {
//         await _audioPlayer.pause();
//       } else {
//         await _audioPlayer.play();
//       }
//       setState(() {
//         _isPlaying = !_isPlaying;
//       });
//     }
//   } catch (e) {
//     print("Error playing audio: $e");
//   }
// }

// String _formatDuration(double seconds) {
//   final int hours = (seconds / 3600).floor();
//   final int minutes = ((seconds % 3600) / 60).floor();
//   final int secs = (seconds % 60).floor();
//   if (hours > 0) {
//     return '$hours hr ${minutes.toString().padLeft(2, '0')} min ${secs.toString().padLeft(2, '0')} sec';
//   } else {
//     return '${minutes.toString().padLeft(2, '0')} min ${secs.toString().padLeft(2, '0')} sec';
//   }
// }
