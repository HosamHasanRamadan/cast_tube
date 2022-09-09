import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cast_tube/models/youtube_track_details.dart';
import 'package:cast_tube/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:cast_tube/extensions/extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );

  String? path;
  if (UniversalPlatform.isWeb == false) path = (await getApplicationSupportDirectory()).path;

  final isar = await Isar.open(
    schemas: [YoutubeTrackDetailsSchema],
    inspector: kDebugMode,
    directory: path,
  );

  runApp(
    ProviderScope(
      overrides: [
        isarDbProvider.overrideWithValue(isar),
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
      title: 'Cast Tube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  AudioPlayer get player => ref.read(audioPlayerProvider);

  bool loading = false;
  final controller = TextEditingController();
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    ref.listenOnce<AsyncValue<String?>>(
      receiveIntentProvider,
      (previous, next) {
        final value = next.valueOrNull;
        if (value.isNotNull && getIdFromUrl(value!).isNotNull) {
          controller.text = value;
          fetchTrack();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
    FocusManager.instance.primaryFocus?.unfocus();
    void showInvalidUrlSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Url'),
        ),
      );
    }

    if (controller.text.isEmpty || getIdFromUrl(controller.text) == null) {
      showInvalidUrlSnackBar();
      return;
    }
    setState(() {
      isFetching = true;
    });
    try {
      await ref.read(youtubePlayerProvider).fetchAndSave(controller.text);
    } catch (e, stacktrace) {
      log(
        isRich: true,
        error: e,
        stackTrace: stacktrace,
      );
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
    final playbackState = ref.watch(playbackStateProvider).valueOrNull;

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                if (selectedTrack != null) ...[
                  Expanded(
                    child: Image(
                      image: CachedNetworkImageProvider(
                        selectedTrack.thumbnailUrl.toString(),
                      ),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        playbackState?.updatePosition == null ? '--:--' : playbackState!.updatePosition.hhmmss,
                      ),
                      Spacer(),
                      Text(
                        playbackState?.duration == null ? '--:--' : playbackState!.duration!.hhmmss,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrackTile extends StatefulWidget {
  final YoutubeTrackDetails youtubeVideoDetails;
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
      leading: Image(
        image: CachedNetworkImageProvider(
          track.thumbnailUrl.toString(),
        ),
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

  Future<void> playStoredValue(YoutubeTrackDetails track) async {
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

class YouTubePlayer {
  final Reader _read;
  AudioPlayer get _audioPlayer => _read(audioPlayerProvider);
  YoutubeExplode get _youtube => _read(youtubeProvider);
  // List<YoutubeTrackDetails> get _youtubeTracksHistory => _read(tracksListProvider);
  // Box<Map> get _tracksStorageHistory => _read(loadedTracksBox);
  Isar get _db => _read(isarDbProvider);

  YouTubePlayer(this._read);

  Future<void> fetchAndSave(String newVideoUrl) async {
    final trackId = getIdFromUrl(newVideoUrl);
    if (trackId == null) return;
    final streams = await _youtube.videos.streamsClient.getManifest(newVideoUrl);
    final video = await _youtube.videos.get(newVideoUrl);

    final audioUrl = streams.audioOnly.first.url;
    final newTrack = YoutubeTrackDetails()
      ..trackId = trackId
      ..audioStreamUrl = audioUrl
      ..thumbnailUrl = video.thumbnails.mediumResUrl.url
      ..title = video.title
      ..url = newVideoUrl.url
      ..duration = video.duration;
    _db.writeTxn((isar) async {
      await isar.youtubeTrackDetailss.put(newTrack);
    });
  }

  Future<void> playAndUpdateStoredValue(YoutubeTrackDetails track) async {
    final selectedTrack = _read(selectedTrackProvider.state);

    try {
      _audioPlayer.stop();
      _audioPlayer.setAudioSource(
        AudioSource.uri(track.audioStreamUrl,
            tag: MediaItem(
              id: track.url.toString(),
              title: track.title,
              artUri: track.thumbnailUrl,
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
      _db.writeTxn((isar) async {
        await isar.youtubeTrackDetailss.put(updatedTrack);
      });
      await _audioPlayer.stop();
      _audioPlayer.setAudioSource(
        AudioSource.uri(updatedTrack.audioStreamUrl,
            tag: MediaItem(
              id: updatedTrack.url.toString(),
              title: updatedTrack.title,
              artUri: updatedTrack.thumbnailUrl,
            )),
      );
      selectedTrack.state = track.copyWith();
      _audioPlayer.play();
    }
  }
}
