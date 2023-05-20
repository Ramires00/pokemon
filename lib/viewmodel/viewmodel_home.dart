import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/model/pokemon_metadata.dart';
import 'package:pokemon/usecase/usecase_get_pokemondata.dart';

class ViewModelHome extends GetxController {
  ViewModelHome({required UsecaseGetPokemonData usecase}) : _usecase = usecase;

  final UsecaseGetPokemonData _usecase;

  int pageKey = 0;

  @override
  void onInit() {
    pagingController.addPageRequestListener((_) async {
      await fetchNewPage();
      pageKey = pageKey + 20;
    });

    super.onInit();
  }

  final PagingController<int, PokemonMetadata> pagingController =
      PagingController<int, PokemonMetadata>(
    firstPageKey: 0,
  );

  Future fetchNewPage() async {
    await _usecase.execute(
      pageKey.toString(),
    );

    if (_hasNextPage()) {
      pagingController.appendPage(_usecase.data.pokemonMetadatas, pageKey);
    } else {
      pagingController.appendLastPage(_usecase.data.pokemonMetadatas);
    }
  }

  bool _hasNextPage() => _usecase.data.next.isNotEmpty;
}
