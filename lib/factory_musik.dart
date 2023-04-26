// Factory Method pattern для створення об'єктів музичних треків у додатку
// музики на мові Dart:

// Абстрактний клас треку
abstract class Track {
  String? artist;
  String? title;

  String getArtist();
  String getTitle();
}

// Класи конкретних треків
class Song extends Track {
  String? artist;
  String? title;

  Song({required this.artist, required this.title});

  @override
  String getArtist() {
    return artist!;
  }

  @override
  String getTitle() {
    return title!;
  }
}

class Podcast extends Track {
  String host;
  String? title;

  Podcast({required this.host, required this.title});

  @override
  String getArtist() {
    return host;
  }

  @override
  String getTitle() {
    return title!;
  }
}

// Абстрактний клас фабрики
abstract class TrackFactory {
  Track createTrack();
}

// Фабрики для конкретних типів треків
class SongFactory extends TrackFactory {
  String artist;
  String title;

  SongFactory({required this.artist, required this.title});

  @override
  Track createTrack() {
    return Song(artist: artist, title: title);
  }
}

class PodcastFactory extends TrackFactory {
  String host;
  String title;

  PodcastFactory({required this.host, required this.title});

  @override
  Track createTrack() {
    return Podcast(host: host, title: title);
  }
}

// Клас додатку музики, який використовує фабрику для створення треків
class MusicApp {
  List<Track> playlist = [];

  void addTrack(TrackFactory factory) {
    playlist.add(factory.createTrack());
  }
}

// Використання
void main() {
  MusicApp app = MusicApp();

  // Додавання пісні
  SongFactory songFactory =
      SongFactory(artist: "The Beatles", title: "Hey Jude");
  app.addTrack(songFactory);

  // Додавання подкасту
  PodcastFactory podcastFactory = PodcastFactory(
      host: "Joe Rogan", title: "Episode #1555 - Edward Snowden");
  app.addTrack(podcastFactory);

  // Друкуємо плейліст
  for (var track in app.playlist) {
    print("Artist: ${track.getArtist()}, Title: ${track.getTitle()}");
  }
}
