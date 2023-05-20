import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/extensions/ext_context.dart';
import 'package:pokemon/core/extensions/ext_string.dart';
import 'package:pokemon/core/model/pokemon_metadata.dart';
import 'package:pokemon/view/widget/appbar/custom_appbar.dart';
import 'package:pokemon/view/widget/appbar/divider_appbar.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';

class ViewHome extends StatelessWidget {
  ViewHome({Key? key}) : super(key: key);

  final ViewModelHome _viewmodel = Get.find<ViewModelHome>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colors.background,
        appBar: CustomAppBar(
          title: Image.asset(
            'assets/images/pokemon-logo.png',
            width: 300,
            height: 300,
          ),
          color: context.colors.background,
        ),
        body: _list(),
      );

  Widget _list() => PagedListView(
        pagingController: _viewmodel.pagingController,
        builderDelegate: _builderDelegate(),
      );

  PagedChildBuilderDelegate<PokemonMetadata> _builderDelegate() =>
      PagedChildBuilderDelegate<PokemonMetadata>(
        itemBuilder: (context, item, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(20),
              leading: _circleAvatar(context, item),
              title: Text(item.name.firstCapital),
            ),
            const DividerAppbar(),
          ],
        ),
      );

  _circleAvatar(BuildContext context, PokemonMetadata item) => CircleAvatar(
        radius: 30,
        backgroundColor: context.colors.onSecondary,
        child: CachedNetworkImage(
          imageUrl: baseUrlSprite + item.url.pokemonImage,
        ),
      );
}
