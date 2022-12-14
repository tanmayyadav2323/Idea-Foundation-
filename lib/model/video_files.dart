import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoFiles extends Equatable {
  final String id;
  final String title;
  final String code;
  final String link;
  final String content;

  VideoFiles({
    required this.id,
    required this.title,
    required this.code,
    required this.link,
    required this.content,
  });


  VideoFiles copyWith({
    String? id,
    String? title,
    String? code,
    String? link,
    String? content,
  }) {
    return VideoFiles(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      link: link ?? this.link,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'link': link,
      'content': content,
    };
  }

  factory VideoFiles.fromMap(Map<String, dynamic> map) {
    return VideoFiles(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      code: map['code'] ?? '',
      link: map['link'] ?? '',
      content: map['content'] ?? '',
    );
  }


  @override
  List<Object> get props {
    return [
      id,
      title,
      code,
      link,
      content,
    ];
  }
}
