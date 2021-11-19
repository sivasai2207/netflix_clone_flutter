import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/data/core/api_client.dart';
import 'package:netflix_clone/data/data_sources/movie_remote_data_source.dart';
import 'package:netflix_clone/data/repositories/movie_repository_imple.dart';
import 'package:netflix_clone/domain/repositories/movie_repository.dart';
import 'package:netflix_clone/domain/usecases/get_coming_soon.dart';
import 'package:netflix_clone/domain/usecases/get_playing_now.dart';
import 'package:netflix_clone/domain/usecases/get_popular.dart';
import 'package:netflix_clone/domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
      getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
      getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
      getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
      getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
      getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

}
