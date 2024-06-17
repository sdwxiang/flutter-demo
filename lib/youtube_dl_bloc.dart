import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class YoutubeDLEvent extends Equatable {
  const YoutubeDLEvent();
}

class DownloadVideo extends YoutubeDLEvent {
  final String videoID;

  const DownloadVideo(this.videoID);
  
  @override
  List<Object?> get props => [videoID];
}

abstract class YoutubeDLState extends Equatable {
  const YoutubeDLState();
}

class InitState extends YoutubeDLState {
  const InitState();
  
  @override
  List<Object?> get props => [];
}

class YoutubeDLUrl extends YoutubeDLState {
  final String url;

  const YoutubeDLUrl(this.url);
  
  @override
  List<Object?> get props => [url];
}

class YoutubeDLBloc extends Bloc<YoutubeDLEvent, YoutubeDLState> {
  YoutubeDLBloc() : super(const InitState()) {
    on<DownloadVideo>(_downloadVideo);
  }

  FutureOr<void> _downloadVideo(DownloadVideo event, Emitter<YoutubeDLState> emit) {
    emit(YoutubeDLUrl(event.videoID));
  }
}