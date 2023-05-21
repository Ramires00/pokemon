import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/extensions/ext_context.dart';
import 'package:pokemon/core/extensions/ext_string.dart';
import 'package:pokemon/view/widget/appbar/custom_appbar.dart';
import 'package:pokemon/viewmodel/viewmodel_pokemon_details.dart';

class ViewPokemonDetails extends StatelessWidget {
  ViewPokemonDetails({super.key});

  final ViewModelPokemonDetails _viewModelPokemonDetails =
      Get.find<ViewModelPokemonDetails>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
          color: context.colors.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: context.colors.background,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: context.colors.onSecondary,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _header(context),
                  _tileNumber(),
                  _tileHeight(),
                  _tileWeight()
                ],
              ),
            ),
          ),
        ),
      );

  _header(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _avatar(context),
            const SizedBox(
              height: 30,
            ),
            Text(
              _viewModelPokemonDetails.pokemon.name.firstCapital,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );

  _avatar(BuildContext context) => CircleAvatar(
        radius: 100,
        backgroundColor: context.colors.onSecondary,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: CachedNetworkImage(
            imageUrl: _viewModelPokemonDetails.pokemon.sprites.artwork,
          ),
        ),
      );

  _tileNumber() => ListTile(
        title: const Text("Número"),
        trailing: Text(
          _viewModelPokemonDetails.pokemon.id.toString(),
        ),
      );

  _tileHeight() => ListTile(
        title: const Text("Altura"),
        trailing: Text(
          _viewModelPokemonDetails.pokemon.height.toString(),
        ),
      );

  _tileWeight() => ListTile(
        title: const Text("Peso"),
        trailing: Text(
          _viewModelPokemonDetails.pokemon.weight.toString(),
        ),
      );
}
