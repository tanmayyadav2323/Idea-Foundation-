import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoFiles extends Equatable {
  final String title;
  final String code;
  final String link;
  final String content;
  VideoFiles({
    required this.title,
    required this.code,
    required this.link,
    required this.content,
  });




 

  VideoFiles copyWith({
    String? title,
    String? code,
    String? link,
    String? content,
  }) {
    return VideoFiles(
      title: title ?? this.title,
      code: code ?? this.code,
      link: link ?? this.link,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'code': code,
      'link': link,
      'content': content,
    };
  }

  factory VideoFiles.fromMap(Map<String, dynamic> map) {
    return VideoFiles(
      title: map['title'] ?? '',
      code: map['code'] ?? '',
      link: map['link'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoFiles.fromJson(String source) => VideoFiles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoFiles(title: $title, code: $code, link: $link, content: $content)';
  }

  @override
  List<Object> get props => [title, code, link, content];
}
