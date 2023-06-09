import 'package:either_dart/either.dart';
import 'package:marvel_mottu/core/errors/failures.dart';
import 'package:marvel_mottu/features/domain/entities/request_pagination_entity.dart';
import 'package:marvel_mottu/features/domain/entities/result_character_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, ResultCharacterEntity>> getCharacters({
    required RequestPaginationEntity requestPagination,
  });
}
