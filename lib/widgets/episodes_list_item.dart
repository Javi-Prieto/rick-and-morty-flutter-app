import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';

class EpisodeListItem extends StatelessWidget {
  const EpisodeListItem({super.key, required this.episodes});
  final List<Result>  episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return SizedBox(
          height: 150,
          child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(episodes[index].name!.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text(episodes[index].episode!),
                        ],
                      ),
                      const Divider(),
                      Text('Release date: ${episodes[index].airDate!}'),
                      Text('Characters Number: ${episodes[index].characters!.length}')
                    ],
                  ))),
        );
      },
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      itemCount: episodes.length,
    );
  }
}