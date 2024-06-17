import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class YoutubeVideoUrlParserEvent extends Equatable {
  const YoutubeVideoUrlParserEvent();
}

class StartParse extends YoutubeVideoUrlParserEvent {
  final String videoID;

  const StartParse(this.videoID);
  
  @override
  List<Object?> get props => [videoID];
}

abstract class YoutubeVideoUrlParserState extends Equatable {
  const YoutubeVideoUrlParserState();
}

class ParseInit extends YoutubeVideoUrlParserState {
  const ParseInit();
  
  @override
  List<Object?> get props => [];
}

class ParseInProgress extends YoutubeVideoUrlParserState {
  const ParseInProgress();
  
  @override
  List<Object?> get props => [];
}

class ParseCompleted extends YoutubeVideoUrlParserState {
  final String url;

  const ParseCompleted(this.url);
  
  @override
  List<Object?> get props => [url];
}

class ParseFailed extends YoutubeVideoUrlParserState {
  const ParseFailed();
  
  @override
  List<Object?> get props => [];
}

class YoutubeVideoUrlParserBloc extends Bloc<YoutubeVideoUrlParserEvent, YoutubeVideoUrlParserState> {
  YoutubeVideoUrlParserBloc() : super(const ParseInit()) {
    on<StartParse>(_downloadVideo);
  }

  FutureOr<void> _downloadVideo(StartParse event, Emitter<YoutubeVideoUrlParserState> emit) {
    emit(ParseCompleted(event.videoID));
  }
}