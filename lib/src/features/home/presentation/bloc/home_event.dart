import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomeEvent extends Event {}

class HomeEventOnReady extends HomeEvent {}

class HomeEventCalculateOffer extends HomeEvent {
  final double value;
  BuildContext context;

  HomeEventCalculateOffer(this.context, {required this.value});
}

class HomeEventCalculateEconomy extends HomeEvent {
  final OfferModel model;

  HomeEventCalculateEconomy({
    required this.model,
  });
}
