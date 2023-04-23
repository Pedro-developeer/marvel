import 'package:get/get.dart';
import 'package:marvel_mottu/core/http_client/http_client_impl.dart';
import 'package:marvel_mottu/features/data/data_sources/character_data_source_impl.dart';
import 'package:marvel_mottu/features/data/repositories/character_repository_impl.dart';
import 'package:marvel_mottu/features/domain/use_cases/get_characters_use_case.dart';
import 'package:marvel_mottu/features/presenter/controllers/home_controller.dart';

class DependencyManager implements Bindings {
  @override
  void dependencies() {
    // Registra a implementação do cliente HTTP como um objeto lazy que será criado somente quando necessário
    Get.lazyPut(() => HttpClientImpl());

    // Registra a implementação do data source para acesso aos dados dos personagens como um objeto lazy que será criado somente quando necessário
    Get.lazyPut(
      () => CharacterDataSourceImpl(
        httpClient: Get.find<HttpClientImpl>(),
      ),
    );

    // Registra a implementação do repositório de personagens como um objeto lazy que será criado somente quando necessário
    Get.lazyPut(
      () => CharacterRepositoryImpl(
        characterDataSource: Get.find<CharacterDataSourceImpl>(),
      ),
    );

    // Registra o caso de uso para obtenção dos personagens como um objeto lazy que será criado somente quando necessário
    Get.lazyPut(
      () => GetCharactersUseCase(
        characterRepository: Get.find<CharacterRepositoryImpl>(),
      ),
    );

    // Registra o controller responsável pela lógica da tela inicial como um objeto lazy que será criado somente quando necessário
    Get.lazyPut(
      () => HomeController(
        getCharactersUseCase: Get.find(),
      ),
    );
  }
}
