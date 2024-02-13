import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/episode_detail_bloc/episodes_detail_bloc.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository_impl.dart';
import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen({super.key, required this.episodeId});
  final int episodeId;
  
  Widget _getImage(String episodeSeason){
    if(episodeSeason.startsWith('S01')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/5/53/Rick_y_morty.png/revision/latest?cb=20170331115948&path-prefix=es'));
    }else if(episodeSeason.startsWith('S02')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/2/26/Rick_y_Morty_Temporada_2.jpg/revision/latest?cb=20200606131609&path-prefix=es'));
    }else if(episodeSeason.startsWith('S03')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/2/2d/Rick_y_Morty_Temporada_3.jpg/revision/latest?cb=20220210174459&path-prefix=es'));
    }else if(episodeSeason.startsWith('S04')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/a/af/Rick_y_Morty_Temporada_4.jpg/revision/latest?cb=20201211173353&path-prefix=es'));
    }else if(episodeSeason.startsWith('S05')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/f/f7/Rick_y_Morty_Temporada_5.jpg/revision/latest?cb=20220210161441&path-prefix=es'));
    }else if(episodeSeason.startsWith('S06')){
      return const Image(image: NetworkImage('https://es.web.img3.acsta.net/pictures/23/09/12/17/33/1036366.jpg'));
    }else if(episodeSeason.startsWith('S07')){
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/2/2f/Temporada_7.jpg/revision/latest?cb=20230925212754&path-prefix=es'));
    }else{
      return const Image(image: NetworkImage('https://static.wikia.nocookie.net/wiki-de-rick-morty/images/5/53/Rick_y_morty.png/revision/latest?cb=20170331115948&path-prefix=es'));
    }
  }


  @override
  Widget build(BuildContext context) {
    EpisodeRepository episodeRepository =
      EpisodesRespositoryImpl(episodeService: EpisodeService.create());
    return BlocProvider(
        create: (context) {
          return EpisodesDetailBloc(episodeRepository)..add(EpisodesDetailFetchEvent(episodeId: episodeId));
        },
        child: Container(
          child: _episodeDetailView(context),
        ));
  }

  Widget _episodeDetailView(BuildContext context){
    return BlocBuilder<EpisodesDetailBloc, EpisodesDetailState>(
      buildWhen: (previous, current) {
        return current is EpisodesDetailInitial || current is EpisodeDetailFetched || current is EpisodeDetailFetchError;
      },
      builder: (context, state) {
        if (state is EpisodesDetailInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EpisodeDetailFetchError) {
          return Column(
            children: [
              Text(state.messageError),
              ElevatedButton(
                onPressed: () {
                  context.watch<EpisodesDetailBloc>().add(EpisodesDetailFetchEvent(episodeId: episodeId));
                },
                child: const Text('Retry'),
              )
            ],
          );
        } else if (state is EpisodeDetailFetched) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              title: Text(state.episode.name!),
              centerTitle: true,
            ),
            body: Column(
              children: [
                _getImage(state.episode.episode!),
                const Divider(),
                const Text('Created At', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                Text(state.episode.created!.toString()),
              ],
            ),
          );
        } else {
          return const Text('Not support');
        }
      },
    );
  }
}
