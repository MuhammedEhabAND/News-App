
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/cubit/AppCubit/app_state.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';

import 'package:news_app/screens/sports_screen.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) =>BlocProvider.of(context);
  String apiKey = '3c32697b0d2e432f81812ffb7d9adca0';
  bool isSearching = false;
  String searchingText = '';
  void changeAppBar(){
    isSearching = !isSearching;
    emit(ChangeAppBar());

  }


  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business) , label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined) , label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball) , label: 'Sports'),

  ];
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),


  ];
  void changeNavBarItems(int index){
    currentIndex = index;
    if(currentIndex == 1)
      getScienceData();
    if(currentIndex == 2)
      getSportsData();


    emit(AppNavBarChange());
  }

  List<dynamic> business = [];
  void getBusinessData(){
    emit(GetBusinessNewsLoading());
    if(business.length == 0){
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'business',
      'apiKey': apiKey
    }).then((value) {
      business= value.data['articles'];
      emit(GetBusinessNewsSuccess());
    }).catchError((onError){
      emit(GetBusinessNewsFailure(onError.toString()));


    });
    }else{
      emit(GetBusinessNewsSuccess());
    }
  }
  List<dynamic> science = [];
  void getScienceData(){

    emit(GetScienceNewsLoading());
    if(science.length ==0 ){
      DioHelper.getData('v2/top-headlines', {
        'country':'eg',
        'category':'science',
        'apiKey':apiKey
      }).then((value) {
        science= value.data['articles'];
        emit(GetScienceNewsSuccess());
      }).catchError((onError){
        print('Error is ${onError.toString()}');
        emit(GetScienceNewsFailure(onError.toString()));


      });
    }else{
      emit(GetScienceNewsSuccess());
    }

  }
  List<dynamic> sports = [];
  void getSportsData(){
    emit(GetSportsNewsLoading());
    if(sports.length == 0){
      DioHelper.getData('v2/top-headlines', {
        'country':'eg',
        'category':'sports',
        'apiKey':apiKey
      }).then((value) {
        sports= value.data['articles'];
        emit(GetSportsNewsSuccess());
      }).catchError((onError){
        emit(GetSportsNewsFailure(onError.toString()));


      });
    }else{
      emit(GetSportsNewsSuccess());
    }

  }

  List<dynamic> searchedData = [];
  void getSearchedData(String searchedText){
    emit(GetSearchedNewsLoading());

      DioHelper.getData('v2/everything', {
        'q':'$searchedText',
        'apiKey':apiKey
      }).then((value) {
        searchedData= value.data['articles'];
        print(searchedData);
        emit(GetSearchedNewsSuccess());
      }).catchError((onError){
        emit(GetSearchedNewsFailure(onError.toString()));


      });

      emit(GetSearchedNewsSuccess());

  }


}
