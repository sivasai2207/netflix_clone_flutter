import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/entities/app_error.dart';
import 'package:netflix_clone/domain/entities/movie_entity.dart';
import 'package:netflix_clone/domain/entities/no_params.dart';
import 'package:netflix_clone/domain/repositories/movie_repository.dart';
import 'package:netflix_clone/domain/usecases/usecase.dart';

class GetComingSoon extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;
  
  GetComingSoon(this.repository);
  @override
  Future<Either <AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
 
}
