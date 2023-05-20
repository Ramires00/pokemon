import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';

class ViewHome extends StatelessWidget {
  ViewHome({Key? key}) : super(key: key);

  final ViewModelHome _viewmodel = Get.find<ViewModelHome>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: _list(),
      );

  Widget _list() => PagedListView(
        pagingController: _viewmodel.pagingController,
        builderDelegate: _builderDelegate(),
      );

  PagedChildBuilderDelegate _builderDelegate() => PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => ListTile(
          title: Text(item.name),
        ),
      );
}
