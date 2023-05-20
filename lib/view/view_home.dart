import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/extensions/ext_string.dart';
import 'package:pokemon/core/model/pokemon_metadata.dart';
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

  PagedChildBuilderDelegate<PokemonMetadata> _builderDelegate() =>
      PagedChildBuilderDelegate<PokemonMetadata>(
        itemBuilder: (context, item, index) => ListTile(
          trailing: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: baseUrlSprite + item.url.pokemonImage,
            ),
          ),
          title: Text(item.name),
        ),
      );
}
