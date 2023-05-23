import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/extensions/ext_context.dart';
import 'package:pokemon/core/extensions/ext_string.dart';
import 'package:pokemon/core/model/pokemon_metadata.dart';
import 'package:pokemon/view/view_pokemon_details.dart';
import 'package:pokemon/view/widget/appbar/custom_appbar.dart';
import 'package:pokemon/view/widget/appbar/divider_appbar.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';
import 'package:pokemon/viewmodel/viewmodel_pokemon_details.dart';

class ViewHome extends StatelessWidget {
  ViewHome({Key? key}) : super(key: key);

  final ViewModelHome _viewModelHome = Get.find<ViewModelHome>();
  final ViewModelPokemonDetails _viewModelPokemonDetails = Get.find<ViewModelPokemonDetails>();

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
        body: Obx(
          () => _viewModelPokemonDetails.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _list(context),
        ),
      );

  Widget _list(BuildContext context) => PagedListView(
        pagingController: _viewModelHome.pagingController,
        builderDelegate: _builderDelegate(context),
      );

  PagedChildBuilderDelegate<PokemonMetadata> _builderDelegate(BuildContext ctx) =>
      PagedChildBuilderDelegate<PokemonMetadata>(
        itemBuilder: (context, item, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._pokemonTile(item, ctx),
          ],
        ),
      );

  Future<void> _onPokemonTapped(PokemonMetadata item, BuildContext ctx) async {
    _viewModelPokemonDetails.isLoading.value = true;
    _viewModelPokemonDetails
        .fetchPokemon(
          item.url.pokemonId,
        )
        .then(
          (_) => Navigator.push(
            ctx,
            CupertinoPageRoute(
              builder: (context) => ViewPokemonDetails(),
            ),
          ),
        );
  }

  Widget _circleAvatar(BuildContext context, PokemonMetadata item) => CircleAvatar(
        radius: 30,
        backgroundColor: context.colors.onSecondary,
        child: CachedNetworkImage(
          imageUrl: baseUrlSprite + item.url.pokemonImage,
        ),
      );

  List<Widget> _pokemonTile(PokemonMetadata item, BuildContext ctx) => [
        ListTile(
          onTap: () => _onPokemonTapped(item, ctx),
          contentPadding: const EdgeInsets.all(20),
          leading: _circleAvatar(ctx, item),
          title: Text(item.name.firstCapital),
        ),
        const DividerAppbar(),
      ];
}
