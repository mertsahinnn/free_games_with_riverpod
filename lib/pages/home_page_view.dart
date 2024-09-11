import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_games_with_riverpod/models/game.dart';
import 'package:free_games_with_riverpod/pages/home_page_provider.dart';
import 'package:free_games_with_riverpod/services/launch_url.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageProvider);
    final title = ref.watch(homePageTitleProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const CategoryDrawer(),
      body: state.when(
        skipError: false,
        data: (gameList) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final game = gameList[index];
              return GameCard(game: game);
            },
            itemCount: gameList.length,
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () =>  Center(
          child: Lottie.asset('assets/loading_1.json'),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchGameUrl(game.gameUrl ?? '');
      },
      child: Card(
        child: Column(
          children: [
            GameImage(game: game),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    game.shortDescription ?? '',
                    style: const TextStyle(
                      color: Color.fromRGBO(158, 168, 184, 1),
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        '${game.platform} / ${game.genre}',
                        style: const TextStyle(
                            color: Color.fromRGBO(158, 168, 184, 1),
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GameImage extends StatelessWidget {
  const GameImage({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 206,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage(
          placeholder: MemoryImage(
            kTransparentImage,
          ),
          image: NetworkImage(game.thumbnail ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryDrawer extends ConsumerWidget {
  const CategoryDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              if (index == 0) {
                ref.read(homePageProvider.notifier).fetchAllGame();
                ref
                  .read(homePageTitleProvider.notifier)
                  .settitle('All Games');
                Navigator.of(context).pop();
                return;
              }
              ref
                  .read(homePageProvider.notifier)
                  .getGenreGames(categories[index]);

              ref
                  .read(homePageTitleProvider.notifier)
                  .settitle(categories[index].toUpperCase());
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
