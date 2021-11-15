import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/data/core/api_client.dart';
import 'package:netflix_clone/data/data_sources/movie_remote_data_source.dart';
import 'package:netflix_clone/data/repositories/movie_repository_imple.dart';
import 'package:netflix_clone/domain/entities/app_error.dart';
import 'package:netflix_clone/domain/entities/movie_entity.dart';
import 'package:netflix_clone/domain/entities/no_params.dart';
import 'package:netflix_clone/domain/repositories/movie_repository.dart';
import 'package:netflix_clone/domain/usecases/get_trending.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of movies');
    print(r);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
