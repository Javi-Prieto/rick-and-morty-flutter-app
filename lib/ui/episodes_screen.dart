import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
  EpisodeRepository episodeRepository = EpisodesRespositoryImpl(episodeService: EpisodeService.create());


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) {
            return EpisodesBloc(episodeRepository)..add(EpisodesFetchEvent());
          },
          child: Container(
            child: _episodeView(context),
          )
    );
  }

  Widget _episodeView(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      builder: (context, state) {
        if (state is EpisodesInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EpisodesFetchError) {
          return Column(
            children: [
              Text(state.messageError),
              ElevatedButton(
                onPressed: () {
                  context.watch<EpisodesBloc>().add(EpisodesFetchEvent());
                },
                child: const Text('Retry'),
              )
            ],
          );
        } else if (state is EpisodesFetched) {
          return EpisodeListItem(episodes: state.episodeList,);
        } else {
          return const Text('Not support');
        }
      },
    );
  }
}