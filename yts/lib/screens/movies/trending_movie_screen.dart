import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/movie_model.dart';
import '../../providers/movie_provider.dart';
import '../../widgets/movies/movie_tile.dart';


class TrendingMovieScreen extends StatefulWidget {
  @override
  State<TrendingMovieScreen> createState() => _TrendingMovieScreenState();
}

class _TrendingMovieScreenState extends State<TrendingMovieScreen> {

  @override
  void initState(){
    print('prints at first');
    Provider.of<MovieProvider>(context, listen: false).loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieModel> movieList = Provider.of<MovieProvider>(context).movies;

    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieTile(movie: movieList[index]);
          }),
    );
  }
}