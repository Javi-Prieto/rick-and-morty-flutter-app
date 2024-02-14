import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/episodes_bloc/episodes_bloc.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';
import 'package:rick_and_morty_flutter_app/ui/episode_detail_screen.dart';

class EpisodeListItem extends StatelessWidget {
  const EpisodeListItem({super.key, required this.episodes});
  final List<Result> episodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _episodeDetails(context),
    );
  }

  Widget _episodeDetails(BuildContext context) {
    return BlocListener<EpisodesBloc, EpisodesState>(
      listener: (context, state) {
        if (state is EpisodesDetailClick) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      EpisodeDetailScreen(episodeId: state.episodeId)));
        }
      },
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 150,
            child: InkWell(
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                episodes[index].name!.toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(episodes[index].episode!),
                            ],
                          ),
                          const Divider(),
                          Text('Release date: ${episodes[index].airDate!}'),
                          Text(
                              'Characters Number: ${episodes[index].characters!.length}')
                        ],
                      ))),
              onTap: () {
                BlocProvider.of<EpisodesBloc>(context)
                    .add(EpisodesGoDetailEvent(episodeId: episodes[index].id!));
              },
            ),
          );
        },
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        itemCount: episodes.length,
      ),
    );
  }
}
