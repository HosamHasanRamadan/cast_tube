import 'dart:async';

import 'package:cast_tube/extensions/context_x.dart';
import 'package:cast_tube/extensions/stirng_x.dart';
import 'package:cast_tube/models/youtube_video_details.dart';
import 'package:cast_tube/providers.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  final box = await Hive.openBox<Map>('tracks');

  runApp(
    ProviderScope(
      overrides: [
        loadedTracksBox.overrideWithValue(box),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool loading = false;
  final controller = TextEditingController();
  AudioPlayer get player => ref.read(audioPlayerProvider);

  bool isFetching = false;

  @override
  void initState() {
    ref.read(playbackState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: isFetching,
                  maintainState: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  child: const LinearProgressIndicator(),
                ),
                const Gap(4),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    icon: IconButton(
                      icon: const Icon(Icons.get_app),
                      onPressed: () {
                        if (isFetching) return;
                        fetchTrack();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                      },
                    ),
                  ),
                ),
                const Gap(20),
                const AudioPlayerCard(),
                const Gap(20),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final tracks = ref.watch(tracksListProvider);
                      return ListView(
                        children: tracks
                            .map(
                              (track) => TrackTile(youtubeVideoDetails: track),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchTrack() async {
    setState(() {
      isFetching = true;
    });
    try {
      await ref.read(youtubePlayerProvider).fetchAndSave(controller.text);
    } catch (e, stacktrace) {
      print(stacktrace);
    } finally {
      setState(() {
        isFetching = false;
      });
    }
  }
}

class AudioPlayerCard extends ConsumerWidget {
  const AudioPlayerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audioPlayerProvider);
    final duration = ref.watch(currentTrackTimePosition).valueOrNull;
    final selectedTrack = ref.watch(selectedTrackProvider);
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                if (selectedTrack != null) ...[
                  Expanded(
                    child: Image.network(
                      selectedTrack.thumbnailUrl.toString(),
                    ),
                  ),
                  Gap(20)
                ],
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(selectedTrack?.title ?? 'NoTrack'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(audioPlayerProvider).play();
                            },
                            icon: Icon(
                              Icons.play_arrow,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(audioPlayerProvider).pause();
                            },
                            icon: Icon(
                              Icons.pause,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: player.duration?.inSeconds.toDouble() ?? 1,
              value: duration?.inSeconds.toDouble() ?? 0.0,
              onChangeEnd: (value) {
                player.play();
              },
              onChangeStart: (value) {
                player.pause();
              },
              onChanged: (value) {
                player.seek(Duration(seconds: value.toInt()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrackTile extends StatefulWidget {
  final YoutubeVideoDetails youtubeVideoDetails;
  const TrackTile({
    Key? key,
    required this.youtubeVideoDetails,
  }) : super(key: key);

  @override
  State<TrackTile> createState() => _TrackTileState();
}

class _TrackTileState extends State<TrackTile> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final track = widget.youtubeVideoDetails;

    return ListTile(
      leading: Image.network(
        track.thumbnailUrl.toString(),
      ),
      title: Text(
        track.title,
        maxLines: 2,
      ),
      trailing: IconButton(
        onPressed: () {
          playStoredValue(track);
        },
        icon: loading ? const CircularProgressIndicator() : const Icon(Icons.play_arrow),
      ),
    );
  }

  Future<void> playStoredValue(YoutubeVideoDetails track) async {
    setState(() {
      loading = true;
    });
    final youtubePlayer = context.read(youtubePlayerProvider);

    await youtubePlayer.playAndUpdateStoredValue(track);

    setState(() {
      loading = false;
    });
  }
}

final youtubePlayerProvider = Provider((ref) {
  return YouTubePlayer(ref.read);
});

class YouTubePlayer {
  final Reader _read;
  AudioPlayer get _audioPlayer => _read(audioPlayerProvider);
  YoutubeExplode get _youtube => _read(youtubeProvider);
  List<YoutubeVideoDetails> get _youtubeTracksHistory => _read(tracksListProvider);
  Box<Map> get _tracksStorageHistory => _read(loadedTracksBox);

  YouTubePlayer(this._read);

  Future<void> fetchAndSave(String newVideoUrl) async {
    final streams = await _youtube.videos.streamsClient.getManifest(newVideoUrl);
    final video = await _youtube.videos.get(newVideoUrl);

    final audioUrl = streams.audioOnly.first.url;
    final newTrack = YoutubeVideoDetails(
      audioStreamUrl: audioUrl,
      thumbnailUrl: video.thumbnails.mediumResUrl.url,
      title: video.title,
      url: newVideoUrl.url,
    );

    _tracksStorageHistory.put(newTrack.url.toString(), newTrack.toJson());
  }

  Future<void> playAndUpdateStoredValue(YoutubeVideoDetails track) async {
    final selectedTrack = _read(selectedTrackProvider.state);

    try {
      _audioPlayer.stop();
      _audioPlayer.setAudioSource(
        AudioSource.uri(track.audioStreamUrl,
            tag: MediaItem(
              id: track.url.toString(),
              title: track.title,
            )),
      );
      selectedTrack.state = track.copyWith();

      /// i have to load the file to catch the thrown
      /// exception when playing old youtube track link
      await _audioPlayer.load();
      _audioPlayer.play();
    } on Exception {
      final newVideo = await _youtube.videos.streams.getManifest(track.url);
      final audio = newVideo.audioOnly.first;

      final updatedTrack = track.copyWith(audioStreamUrl: audio.url);
      _tracksStorageHistory.put(updatedTrack.url.toString(), updatedTrack.toJson());
      await _audioPlayer.stop();
      _audioPlayer.setAudioSource(
        AudioSource.uri(updatedTrack.audioStreamUrl,
            tag: MediaItem(
              id: updatedTrack.url.toString(),
              title: updatedTrack.title,
            )),
      );
      selectedTrack.state = track.copyWith();
      _audioPlayer.play();
    }
  }
}

extension YoutubeVideoDetailsX on YoutubeVideoDetails {
  int? get expirationTimestamp {
    final timestamp = audioStreamUrl.queryParameters['expire'];
    return timestamp == null ? null : int.tryParse(timestamp);
  }

  bool get isExpired {
    if (expirationTimestamp == null) return true;
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(expirationTimestamp! * 1000);
    final now = DateTime.now();
    return now.isAfter(expirationDate);
  }
}
