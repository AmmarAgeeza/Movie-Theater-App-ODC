import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/view_model/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app_odc/view_model/cubit/search_cubit/search_state.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../components/core_components/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit,SearchState>(
      listener: (context,state){},
      builder: (context,state)=>Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorManager.backgroundColor,
          title: Text(
            'Search',
            style: AppTextStyles.login(),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: ColorManager.primary,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              defaultFormField(
                controller: SearchCubit.get(context).searchController,
                type: TextInputType.text,
                label: 'Search',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
