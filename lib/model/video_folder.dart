import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:preco/model/video_files.dart';

class VideoFolder extends Equatable {
  final String? id;
  final String name;
  final List<VideoFiles> videos;

  VideoFolder({
    required this.id,
    required this.name,
    required this.videos,
  });

  VideoFolder copyWith({
    String? id,
    String? name,
    List<VideoFiles>? videos,
  }) {
    return VideoFolder(
      id: id ?? this.id,
      name: name ?? this.name,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'videos': videos.map((x) => x.toMap()).toList(),
    };
  }

  factory VideoFolder.fromMap(Map<String, dynamic> map) {
    return VideoFolder(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      videos: List<VideoFiles>.from(map['videos']?.map((x) => VideoFiles.fromMap(x))),
    );
  }

  @override
  List<Object?> get props => [id, name, videos];
}
