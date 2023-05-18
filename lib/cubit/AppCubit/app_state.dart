
import 'package:flutter/material.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppNavBarChange extends AppState {}
class GetBusinessNewsLoading extends AppState{}
class GetBusinessNewsSuccess extends AppState{}
class GetBusinessNewsFailure extends AppState{
  final String error;

  GetBusinessNewsFailure(this.error);

}
class GetSportsNewsLoading extends AppState{}
class GetSportsNewsSuccess extends AppState{}
class GetSportsNewsFailure extends AppState{
  final String error;

  GetSportsNewsFailure(this.error);

}
class GetScienceNewsLoading extends AppState{}
class GetScienceNewsSuccess extends AppState{}
class GetScienceNewsFailure extends AppState{
  final String error;

  GetScienceNewsFailure(this.error);

}
class GetSearchedNewsLoading extends AppState{}
class GetSearchedNewsSuccess extends AppState{}
class GetSearchedNewsFailure extends AppState{
  final String error;

  GetSearchedNewsFailure(this.error);

}
class ChangeAppBar extends AppState{

}