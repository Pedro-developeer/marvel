import 'package:marvel_mottu/features/data/models/result_character_model.dart';
import 'package:marvel_mottu/features/domain/entities/request_pagination_entity.dart';

abstract class CharacterDataSource {
  Future<ResultCharacterModel> getCharacters({
    required RequestPaginationEntity requestPagination,
  });
}
