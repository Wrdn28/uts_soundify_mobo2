import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/music_model.dart';

final musicProvider = StateNotifierProvider<MusicNotifier, List<Music>>((ref) {
  return MusicNotifier();
});

class MusicNotifier extends StateNotifier<List<Music>> {
  MusicNotifier()
      : super([
          Music(
            title: "The triangle",
            artist: "Dune Of Visa",
            streams: "RiskItall",
          ),
          Music(
            title: "Take care of you",
            artist: "Admina Thembi",
            streams: "114k / steams",
          ),
          Music(
            title: "The stranger inside you",
            artist: "Jeane Lebras",
            streams: "60.5k / steams",
          ),
          Music(
            title: "Edwall of beauty mind",
            artist: "Jacob Givson",
            streams: "44.3k / steams",
          ),
        ]);

  void togglePlay(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isPlaying: !state[i].isPlaying)
        else
          state[i].copyWith(isPlaying: false)
    ];
  }
}