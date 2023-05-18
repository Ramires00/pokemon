import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';

class PokemonView extends StatelessWidget {
  PokemonView({Key? key}) : super(key: key);

  final ViewModelHome _viewmodel = Get.find<ViewModelHome>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(),
      );

  Widget _list() => PagedListView(
        pagingController: _viewmodel.pagingController,
        builderDelegate: _builderDelegate(),
      );

  PagedChildBuilderDelegate _builderDelegate() => PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return Placeholder();
        },
      );
}
