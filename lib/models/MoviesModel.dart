import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:housy_assignment2/network/GetData.dart';

import 'MoviesItemModel.dart';

class MoviesModel extends ChangeNotifier {
  final List<MoviesItemModel> list = [];

  MoviesModel() {
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      list.clear();
      list.addAll(await GetData.getMovies());
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
