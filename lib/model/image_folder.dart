import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ImageFolder extends Equatable {
  final String? id;
  final String name;
  final List<String> urls;


  ImageFolder({
    required this.id,
    required this.name,
    required this.urls,
  });


  ImageFolder copyWith({
    String? id,
    String? name,
    List<String>? urls,
  }) {
    return ImageFolder(
      id: id ?? this.id,
      name: name ?? this.name,
      urls: urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'urls': urls,
    };
  }

  factory ImageFolder.fromMap(Map<String, dynamic> map) {
    return ImageFolder(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      urls: List<String>.from(map['urls']),
    );
  }

  @override
  List<Object?> get props => [id, name, urls];
}
