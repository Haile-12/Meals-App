import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemChrome
import 'package:video_player/video_player.dart';
import 'dart:async'; // Required for Timer

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.videoTitle,
  });

  final String videoUrl;
  final String videoTitle;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isMuted = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _centralPlayPauseVisible =
      true; // State for controlling central play/pause button visibility
  Timer? _hideControlsTimer;
  bool _isFullScreen = false; // State for fullscreen mode
  DeviceOrientation _currentOrientation =
      DeviceOrientation.portraitUp; // Track current orientation
  bool _hasInitializationError =
      false; // NEW: Flag to track initialization errors

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller
        .initialize()
        .then((_) {
          setState(() {
            _totalDuration = _controller.value.duration;
          });
          _controller.play(); // Auto-play when initialized

          _controller.addListener(_videoListener);
          _startHideControlsTimer(); // Start timer to hide central play/pause button
        })
        .catchError((error) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load video: $error')),
          );
          setState(() {
            _hasInitializationError = true; // Set error flag
          });
          _controller
              .dispose(); // Dispose the controller if initialization fails
        });
  }

  void _videoListener() {
    if (!mounted) return; // Prevent setState on a disposed widget
    setState(() {
      _currentPosition = _controller.value.position;
      // If video ends, show central play/pause button again
      if (_currentPosition == _totalDuration &&
          _totalDuration != Duration.zero &&
          _controller.value.isPlaying == false) {
        _centralPlayPauseVisible = true;
        _hideControlsTimer?.cancel();
      }
    });
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel(); // Cancel any existing timer
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() {
          _centralPlayPauseVisible = false;
        });
      }
    });
  }

  void _toggleCentralPlayPauseVisibility() {
    setState(() {
      _centralPlayPauseVisible = !_centralPlayPauseVisible;
    });
    if (_centralPlayPauseVisible) {
      _startHideControlsTimer(); // Start timer if central button is made visible
    } else {
      _hideControlsTimer
          ?.cancel(); // Cancel timer if central button is hidden manually
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
      _startHideControlsTimer(); // Keep central button visible after interaction
    });
  }

  void _seekRelative(Duration duration) {
    final newPosition = _currentPosition + duration;
    _controller.seekTo(newPosition);
    if (!_controller.value.isPlaying) {
      _controller.play(); // Play if paused after seeking
    }
    _startHideControlsTimer(); // Keep central button visible after interaction
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      _startHideControlsTimer(); // Keep central button visible after interaction
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        _currentOrientation =
            DeviceOrientation
                .landscapeLeft; // Assume landscape when entering fullscreen
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        _currentOrientation =
            DeviceOrientation
                .portraitUp; // Assume portrait when exiting fullscreen
      }
      // Ensure central play/pause button is visible after fullscreen toggle
      _centralPlayPauseVisible = true;
      _startHideControlsTimer();
    });
  }

  // Method to toggle screen orientation
  void _toggleOrientation() {
    setState(() {
      if (_currentOrientation == DeviceOrientation.portraitUp) {
        _currentOrientation = DeviceOrientation.landscapeLeft;
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        _currentOrientation = DeviceOrientation.portraitUp;
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
      _startHideControlsTimer(); // Keep central button visible after interaction
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel(); // Cancel timer
    _controller.removeListener(_videoListener); // Remove listener
    _controller.dispose(); // Dispose of the controller
    // Reset system overlays and orientations when leaving the screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar:
          _isFullScreen
              ? null // Hide AppBar in fullscreen
              : AppBar(
                title: Text(widget.videoTitle),
                backgroundColor: colorScheme.surfaceContainer,
                foregroundColor: colorScheme.onSurface,
              ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Check _hasInitializationError flag
            if (_hasInitializationError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 60,
                      color: colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading video.',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.error,
                      ),
                    ),
                    Text(
                      'The video could not be played. Please check the URL or try a different video format.',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            // If initialization was successful, display the video and controls
            return Column(
              // Main Column to arrange video and controls vertically
              children: [
                Expanded(
                  child: ColoredBox(
                    color:
                        Colors
                            .black, // Background when video aspect ratio is smaller
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          // Stack for video and central play/pause button
                          alignment: Alignment.center,
                          children: <Widget>[
                            // The main video player
                            GestureDetector(
                              // This GestureDetector is for toggling central play/pause button
                              onTap: _toggleCentralPlayPauseVisibility,
                              behavior:
                                  HitTestBehavior
                                      .opaque, // Ensures it captures taps
                              child: VideoPlayer(_controller),
                            ),

                            // Central play/pause button (animated, overlaid on video)
                            AnimatedOpacity(
                              opacity: _centralPlayPauseVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child: AbsorbPointer(
                                // Prevents interaction when faded out
                                absorbing: !_centralPlayPauseVisible,
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_fill,
                                      // ignore: deprecated_member_use
                                      color: Colors.white.withOpacity(0.8),
                                      size: 80.0,
                                    ),
                                    onPressed: _togglePlayPause,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Video Controls Bar (below the video, always visible)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(
                    0.7,
                  ), // Semi-transparent background for controls
                  child: Column(
                    children: [
                      // Custom Slider for scrubbing
                      Slider(
                        value: _currentPosition.inMilliseconds.toDouble(),
                        max: _totalDuration.inMilliseconds.toDouble(),
                        min: 0.0,
                        activeColor: colorScheme.primary,
                        // ignore: deprecated_member_use
                        inactiveColor: colorScheme.onSurfaceVariant.withOpacity(
                          0.5,
                        ),
                        onChanged: (value) {
                          // Update current position while dragging
                          setState(() {
                            _currentPosition = Duration(
                              milliseconds: value.toInt(),
                            );
                          });
                        },
                        onChangeEnd: (value) {
                          // Seek to the new position when dragging ends
                          _controller.seekTo(
                            Duration(milliseconds: value.toInt()),
                          );
                          if (!_controller.value.isPlaying) {
                            _controller.play(); // Play if paused after seeking
                          }
                          _startHideControlsTimer(); // Keep central button visible after interaction
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.replay_10,
                              color: Colors.white,
                              size: 28,
                            ), // Reduced size
                            onPressed:
                                () =>
                                    _seekRelative(const Duration(seconds: -10)),
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 28, // Reduced size
                            ),
                            onPressed: _togglePlayPause,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.forward_10,
                              color: Colors.white,
                              size: 28,
                            ), // Reduced size
                            onPressed:
                                () =>
                                    _seekRelative(const Duration(seconds: 10)),
                          ),
                          Text(
                            '${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}',
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isMuted ? Icons.volume_off : Icons.volume_up,
                              color: Colors.white,
                              size: 28, // Reduced size
                            ),
                            onPressed: _toggleMute,
                          ),
                          // Rotate button
                          IconButton(
                            icon: Icon(
                              _currentOrientation ==
                                      DeviceOrientation.portraitUp
                                  ? Icons
                                      .screen_rotation_alt // Icon for portrait to landscape
                                  : Icons
                                      .screen_lock_portrait, // Icon for landscape to portrait
                              color: Colors.white,
                              size: 28, // Reduced size
                            ),
                            onPressed: _toggleOrientation,
                          ),
                          IconButton(
                            icon: Icon(
                              _isFullScreen
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                              color: Colors.white,
                              size: 28, // Reduced size
                            ),
                            onPressed: _toggleFullScreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Video Title below video (only visible if not fullscreen)
                if (!_isFullScreen) // Only show title if not in fullscreen
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      8.0,
                      16.0,
                      16.0,
                    ), // Adjusted padding
                    child: Text(
                      widget.videoTitle,
                      style: textTheme.titleLarge!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }
        },
      ),
    );
  }
}
