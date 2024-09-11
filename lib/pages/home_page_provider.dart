import 'package:free_games_with_riverpod/models/game.dart';
import 'package:free_games_with_riverpod/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_provider.g.dart';

@Riverpod(keepAlive: true)
class HomePage extends _$HomePage {
  @override
  FutureOr<List<Game>> build() {
    return getAllGames();
  }

  Future<List<Game>> getAllGames() async {
    final response = await ref.read(dioProvider).get('games');

    final List listGame = response.data;

    return listGame
        .map(
          (e) => Game.fromJson(e),
        )
        .toList();
  }

  Future<void> getGenreGames(String genre) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        final response =
            await ref.read(dioProvider).get('games?category=$genre');
        final List genreListGame = response.data;
        return genreListGame
            .map(
              (e) => Game.fromJson(e),
            )
            .toList();
      },
    );
  }

  Future<void> fetchAllGame() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () {
        return getAllGames();
      },
    );
  }
}

@riverpod
class HomePageTitle extends _$HomePageTitle {
  @override
  String build() {
    return 'All Games';
  }

  void settitle(String title) {
    state = title;
  }
}
