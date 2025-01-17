import 'dart:ui';
import 'dart:io';

import 'package:flapp/flutter_flow/flutter_flow_util.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../components/block_widget.dart';
import '../../components/comment_video_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'shorts_model.dart';
export 'shorts_model.dart';


class ShortsWidget extends StatefulWidget {
    late ShortsModel _model;
 

  @override
  State<ShortsWidget> createState() => _ShortsWidgetState();
}

class _ShortsWidgetState extends State<ShortsWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<List<VideoPostRecord>>(
        stream: queryVideoPostRecord(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }

          final videos = snapshot.data!;
          if (videos.isEmpty) {
            return const Center(
              child: Text(
                'No shorts available.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return ShortsVideoPlayer(
                videoUrl: video.video ?? "0",
                caption: video.postDescription ?? "0",
                videoId: video.reference.id,
                likes: video.likes.length,
                comments: video.comments.length,
                ref: video.reference,
              );
            },
          );
        },
      ),
    );
  }
}

class ShortsVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  final String videoId;
  final int likes;
  final int comments;
  final DocumentReference ref;

  const ShortsVideoPlayer({
    required this.videoUrl,
    required this.caption,
    required this.videoId,
    required this.likes,
    required this.comments,
    super.key,
    required this.ref,
  });

  @override
  _ShortsVideoPlayerState createState() => _ShortsVideoPlayerState();
}

class _ShortsVideoPlayerState extends State<ShortsVideoPlayer> {
    late ShortsModel _model;
  late VideoPlayerController _controller;
  bool isVideoInitialized = false;
  bool isLoading = true;
  bool isBuffering = false;
  bool isLikedByUser = false;

  @override
  void initState() {
    super.initState();
        _model = createModel(context, () => ShortsModel());
    _loadAndCacheVideo();
    _checkIfLikedByUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadAndCacheVideo() async {
    try {
      // Preload the video from the network and store it in the cache
      final file = await DefaultCacheManager().getSingleFile(widget.videoUrl);

      // Initialize the VideoPlayerController with the cached file
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {
            isVideoInitialized = true;
            isLoading = false;
          });
          _controller.setLooping(true);
          _controller.play();
        });

      // Listen for buffering state changes
      _controller.addListener(() {
        if (_controller.value.isBuffering) {
          setState(() {
            isBuffering = true;
          });
        } else {
          setState(() {
            isBuffering = false;
          });
        }
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isBuffering = false;
      });
      print("Error loading video: $error");
    }
  }

  Future<void> _toggleLike() async {
    try {
      final userRef =
          currentUserReference; // Replace with the current user's document reference
      final videoDocRef = FirebaseFirestore.instance
          .collection('video_post')
          .doc(widget.videoId);

      if (isLikedByUser) {
        // If already liked, remove the like
        await videoDocRef.update({
          'likes': FieldValue.arrayRemove([userRef])
        });
        setState(() {
          isLikedByUser = false;
        });
      } else {
        // If not liked, add the like
        await videoDocRef.update({
          'likes': FieldValue.arrayUnion([userRef])
        });
        setState(() {
          isLikedByUser = true;
        });
      }
    } catch (e) {
      print('Error toggling like: $e');
    }
  }

  Future<void> _checkIfLikedByUser() async {
    final userRef =
        currentUserReference; // Replace with the current user's document reference
    final videoDoc = await FirebaseFirestore.instance
        .collection('video_post')
        .doc(widget.videoId)
        .get();

    if (videoDoc.exists) {
      final likes =
          List<DocumentReference>.from(videoDoc.data()?['likes'] ?? []);
      setState(() {
        isLikedByUser = likes.contains(userRef);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isVideoInitialized) {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        }
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Display loading indicator or video player
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : isVideoInitialized
                  ? FittedBox(
                     fit: BoxFit.contain,
                    
                        child: SizedBox(
                           width: _controller.value.size.width,
    height: _controller.value.size.height,
                          child: VideoPlayer(
                            _controller)),
                      
                  )
                  : const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
          // Buffering state indicator
          if (isBuffering)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          // Caption, likes, and comments
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Caption
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.caption,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                // Like/Comment actions
                Column(
                  children: [
                    // Like Button
                    IconButton(
                      onPressed: () async {
                        await _toggleLike();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isLikedByUser ? Colors.red : Colors.white,
                      ),
                    ),
                    Text(
                      '${widget.likes + (isLikedByUser ? 1 : 0)}', // Show updated like count
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    // Comment Button
                    IconButton(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height: 500.0,
                                  child: CommentVideoWidget(
                                    videoPost: widget.ref,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${widget.comments}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
  alignment: AlignmentDirectional(-0.03, 0.07),
  child: wrapWithModel(
    model: _model.blockModel,
    updateCallback: () => safeSetState(() {}),
    child: BlockWidget(),
  ),
)

        ],
      ),
    );
  }
}
