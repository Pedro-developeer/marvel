import 'package:either_dart/src/either.dart';
import 'package:marvel_mottu/core/errors/exceptions.dart';
import 'package:marvel_mottu/core/errors/failures.dart';
import 'package:marvel_mottu/features/data/data_sources/character_data_source.dart';
import 'package:marvel_mottu/features/domain/entities/request_pagination_entity.dart';
import 'package:marvel_mottu/features/domain/entities/result_character_entity.dart';
import 'package:marvel_mottu/features/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDataSource characterDataSource;

  CharacterRepositoryImpl({required this.characterDataSource});

  /// Obtém uma lista de personagens da API da Marvel, usando a fonte de dados [characterDataSource]
  ///
  /// Retorna um [Either] contendo um [Failure] em caso de erro ou um [ResultCharacterEntity] em caso de sucesso.
  ///
  /// Em caso de falha, a exceção [ServerException] é lançada e um [ServerFailure] é retornado.
  ///
  /// [requestPagination] é um objeto que contém informações sobre a paginação dos resultados.
  @override
  Future<Either<Failure, ResultCharacterEntity>> getCharacters(
      {required RequestPaginationEntity requestPagination}) async {
    try {
      final result = await characterDataSource.getCharacters(
          requestPagination: requestPagination);

      return Right(result);
    } on ServerException {
      return Left(
        ServerFailure(message: 'Não foi possível obter os personagens'),
      );
    }
  }
}
