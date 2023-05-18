import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/AppCubit/app_cubit.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'package:news_app/home_layout/home_screen.dart';
import 'package:news_app/shared_helper/shared_preferance_helper.dart';

import 'cubit/ThemeCubit/theme_cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => ThemeCubit(),
  child: BlocConsumer<ThemeCubit, ThemeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1:  TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold)

        ),
          appBarTheme: AppBarTheme(
          elevation:0 ,

          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          )

        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,

        )
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Color(0xff100B20),
          appBarTheme: AppBarTheme(
              elevation:0 ,

              backgroundColor: Color(0xff100B20),
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              actionsIconTheme: IconThemeData(
                  color: Colors.white
              )

          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.grey,
            ),


          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            backgroundColor: Color(0xff100B20),
            unselectedItemColor: Colors.grey

          ),

        cardTheme: CardTheme(
          color: Colors.black26

        ),
        listTileTheme: ListTileThemeData(

          textColor: Colors.grey,

        ),
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.white)
        ),

      ),
      themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      
      home: const HomeScreen(),
    );
  },
),
);
  }
}

