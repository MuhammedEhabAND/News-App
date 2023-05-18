import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components.dart';
import '../cubit/AppCubit/app_cubit.dart';
import '../cubit/AppCubit/app_state.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        AppCubit.get(context).getBusinessData();
        List<dynamic> business = AppCubit.get(context).science;

        return ConditionalBuilder(
              condition: business.length > 0,
              builder: (context ) => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: business.length,
                itemBuilder: (BuildContext context, int index)=>NewsItem(business[index],context),),
              fallback: (context)=>Center(child: CircularProgressIndicator(),));
      },
    );
  }
}

