import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums/equipment.dart';
import '../enums/tag.dart';

class Exercise extends Equatable {
  final String id;
  final String title;
  final List<Tag> tags;
  final Equipment equipment;
  final String asset;

  Exercise({
    @required this.id,
    @required this.title,
    @required this.tags,
    @required this.equipment,
    @required this.asset,
  }) : assert(id != null &&
            title != null &&
            tags != null &&
            equipment != null &&
            asset != null);

  @override
  List<Object> get props => [
        id,
        title,
        tags,
        equipment,
        asset,
      ];
}
