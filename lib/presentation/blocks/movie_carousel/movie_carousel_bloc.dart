import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  MovieCarouselBloc() : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
