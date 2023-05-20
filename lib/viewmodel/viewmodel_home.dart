import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/model/pokemon_metadata.dart';
import 'package:pokemon/usecase/usecase_get_pokemondata.dart';

class ViewModelHome extends GetxController {
  ViewModelHome({required UsecaseGetPokemonData usecase}) : _usecase = usecase;

  final UsecaseGetPokemonData _usecase;

  RxInt pageKey = RxInt(0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((_) async {
      fetchNewPage();
      pageKey.value = pageKey.value + 20;
      refresh();
    });

    super.onInit();
  }

  final PagingController pagingController = PagingController<int, PokemonMetadata>(
    firstPageKey: 0,
  );

  Future fetchNewPage() async {
    await _usecase.execute(
      pageKey.value.toString(),
    );

    if (_hasNextPage()) {
      pagingController.appendPage(_usecase.data.value.pokemonMetadatas, pageKey.value);
    } else {
      pagingController.appendLastPage(_usecase.data.value.pokemonMetadatas);
    }
    refresh();
  }

  bool _hasNextPage() => _usecase.data.value.next.isNotEmpty;
}
