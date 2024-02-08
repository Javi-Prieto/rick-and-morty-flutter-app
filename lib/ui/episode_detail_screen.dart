import 'package:flutter/material.dart';

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen({super.key, required this.episodeId});
  final int episodeId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Text('$episodeId'),
    );
  }
}