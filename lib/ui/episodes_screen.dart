import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/episodes_bloc/episodes_bloc.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository_impl.dart';
import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';
import 'package:rick_and_morty_flutter_app/widgets/episodes_list_item.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  EpisodeRepository episodeRepository =
      EpisodesRespositoryImpl(episodeService: EpisodeService.create());
  String title = 'Season 1';
  late EpisodesBloc _episodesBloc; 
  @override
  void initState() {
    super.initState();
    _episodesBloc = EpisodesBloc(episodeRepository)..add(EpisodesFetchEvent(season: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _episodesBloc,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Episodes $title'),
              actions: [
                IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: const Icon(Icons.filter_list))
              ],
            ),
            body: _episodeView(context)));
  }

  Widget _episodeView(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      buildWhen: (previous, current) {
        return current is! EpisodesDetailClick;
      },
      builder: (context, state) {
        if (state is EpisodesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EpisodesFetchError) {
          return Column(
            children: [
              Text(state.messageError),
              ElevatedButton(
                onPressed: () {
                  context
                      .watch<EpisodesBloc>()
                      .add(EpisodesFetchEvent(season: 1));
                },
                child: const Text('Retry'),
              )
            ],
          );
        } else if (state is EpisodesFetched) {
          return EpisodeListItem(
            episodes: state.episodeList,
          );
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: ListView(
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.one_k_plus_outlined),
                      Text('Season 1'),
                    ],
                  ),
                  onTap: () {
                    _episodesBloc.add(EpisodesFetchEvent(season: 1));
                    setState(() {
                      title = 'Season 1';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.two_k_plus_outlined),
                      Text('Season 2'),
                    ],
                  ),
                  onTap: () {
                    _episodesBloc.add(EpisodesFetchEvent(season: 2));
                    setState(() {
                      title = 'Season 2';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.three_k_plus_outlined),
                      Text('Season 3'),
                    ],
                  ),
                  onTap: () {
                    _episodesBloc.add(EpisodesFetchEvent(season: 3));
                    setState(() {
                      title = 'Season 3';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.four_k_plus_outlined),
                      Text('Season 4'),
                    ],
                  ),
                  onTap: () {
                    _episodesBloc.add(EpisodesFetchEvent(season: 4));
                    setState(() {
                      title = 'Season 4';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.five_k_plus_outlined),
                      Text('Season 5'),
                    ],
                  ),
                  onTap: () {
                    _episodesBloc.add(EpisodesFetchEvent(season: 5));
                    setState(() {
                      title = 'Season 5';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
