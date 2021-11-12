import 'package:flutter/material.dart';

class MovieEntity  {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voterAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    @required this.posterPath,
    @required this.id,
    @required this.backdropPath,
    @required this.title,
    @required this.voterAverage,
    @required this.releaseDate,
    this.overview, double voteAverage,
  }) : assert(id != null, 'Movie id must not be null');
  @override
  List<Object> get props => [id,title];

  @override
  bool get stringify => true;
}
