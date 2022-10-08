import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cast_tube/dialogs/sleep_timer_picker.dart';
import 'package:cast_tube/extensions/extensions.dart';
import 'package:cast_tube/init_app.dart';
import 'package:cast_tube/models/youtube_track_details.dart';
import 'package:cast_tube/providers.dart';
import 'package:cast_tube/utils/deps_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_parser/youtube_parser.dart';

void main() async {
  await initApp();

  runApp(
    UncontrolledProviderScope(
      container: DepsContainer.rootContainer,
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

  final controller = TextEditingController();

  bool loading = false;
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    ref.listenManual<AsyncValue<String?>>(
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
            padding: const EdgeInsets.all(8),
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
                      return ListView.separated(
                        itemCount: tracks.length,
                        separatorBuilder: (context, index) => const Gap(5),
                        itemBuilder: (context, index) {
                          return TrackTile(youtubeVideoDetails: tracks[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SleepTimerPicker(),
            );
          },
          child: const Icon(Icons.timer),
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

class AudioPlayerCard extends HookConsumerWidget {
  const AudioPlayerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audioPlayerProvider);
    final selectedTrack = ref.watch(selectedTrackProvider);
    final currentPosition = useStream(player.positionStream).data;
    final trackDuration = player.duration;

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
                  const Gap(20)
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
                              if (currentPosition == null) return;
                              var seekValue = currentPosition - const Duration(seconds: 10);
                              if (seekValue <= Duration.zero) seekValue = Duration.zero;
                              ref.read(audioPlayerProvider).seek(seekValue);
                            },
                            icon: const Icon(
                              Icons.replay_10,
                            ),
                          ),
                          if (!player.playing)
                            IconButton(
                              onPressed: () {
                                ref.read(audioPlayerProvider).play();
                              },
                              icon: const Icon(
                                Icons.play_arrow,
                              ),
                            ),
                          if (player.playing)
                            IconButton(
                              onPressed: () {
                                ref.read(audioPlayerProvider).pause();
                              },
                              icon: const Icon(
                                Icons.pause,
                              ),
                            ),
                          IconButton(
                            onPressed: () {
                              if (currentPosition == null || player.duration == null) return;
                              var seekValue = currentPosition + const Duration(seconds: 10);
                              if (seekValue >= player.duration!) seekValue = player.duration!;
                              ref.read(audioPlayerProvider).seek(seekValue);
                            },
                            icon: const Icon(
                              Icons.forward_10,
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
                  value: currentPosition?.inSeconds.toDouble() ?? 0.0,
                  onChanged: (value) {
                    player.seek(Duration(seconds: value.toInt()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentPosition == null ? '--:--' : currentPosition.hhmmss,
                      ),
                      const Spacer(),
                      Text(
                        trackDuration == null ? '--:--' : trackDuration.hhmmss,
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
