class Music {
  final String title;
  final String artist;
  final String streams;
  final bool isPlaying;

  Music({
    required this.title,
    required this.artist,
    required this.streams,
    this.isPlaying = false,
  });

  Music copyWith({
    String? title,
    String? artist,
    String? streams,
    bool? isPlaying,
  }) {
    return Music(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      streams: streams ?? this.streams,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}