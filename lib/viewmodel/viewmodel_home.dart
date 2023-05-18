import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/model/pokemon_data.dart';
import 'package:pokemon/repo/repository_pokemon_data.dart';

class ViewModelHome extends GetxController {
  ViewModelHome({required this.repo});

  final RepositoryPokemonData repo;

  int pageKey = 0;

  @override
  void onReady() {
    pagingController.addPageRequestListener((_) async {
      fetchNewPage();
      pageKey = pageKey + 20;
    });

    super.onReady();
  }

  final PagingController pagingController = PagingController(firstPageKey: 0);

  Future<PokemonData> fetchNewPage() async =>
      await repo.get(pageKey.toString());
}
