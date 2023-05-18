import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/AppCubit/app_cubit.dart';
import 'package:news_app/cubit/ThemeCubit/theme_cubit.dart';

import '../components.dart';
import '../cubit/AppCubit/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getScienceData()..getBusinessData()..getSportsData(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          List<dynamic> search = cubit.searchedData;

          return Scaffold(
            appBar: AppBar(
              title: cubit.isSearching ?  TextField(
                decoration: InputDecoration(
                  hintText: 'Search ...',
                ),
                onChanged: (String value) {
                  cubit.getSearchedData(value);
                  search= cubit.searchedData;

                },
                onSubmitted: (String value){
                  cubit.getSearchedData(value);
                  search= cubit.searchedData;


                },
              ) : Text('News App'),
              actions: [
                IconButton(onPressed: () {
                  cubit.changeAppBar();

                }, icon: Icon(Icons.search)),
                IconButton(onPressed: () {
                  ThemeCubit.get(context).changeThemeMode();

                }, icon: Icon(Icons.brightness_4_outlined))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeNavBarItems(index);
              },

            ),
            body: (cubit.isSearching) ?
            ConditionalBuilder(
                condition: search.length > 0,
                builder: (context ) => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: search.length,
                  itemBuilder: (BuildContext context, int index)=>NewsItem(search[index], context),),
                fallback: (context)=>Center(child: CircularProgressIndicator(),)) : cubit.screens[cubit.currentIndex],

          );
        },
      ),
    );
  }
}
