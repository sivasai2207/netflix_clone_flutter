import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/entities/app_error.dart';
import 'package:netflix_clone/domain/entities/movie_entity.dart';
import 'package:netflix_clone/domain/entities/no_params.dart';
import 'package:netflix_clone/domain/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() async {
  unawaited(getIt.init());
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
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
