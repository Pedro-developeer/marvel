import 'dart:convert';
import 'package:marvel_mottu/core/errors/exceptions.dart';
import 'package:marvel_mottu/core/http_client/http_client.dart';
import 'package:marvel_mottu/core/keys/marvel_api_keys.dart';
import 'package:marvel_mottu/core/utils/crypto_util.dart';
import 'package:marvel_mottu/features/data/data_sources/character_data_source.dart';
import 'package:marvel_mottu/features/data/data_sources/services/endpoints/marvel_endpoints.dart';
import 'package:marvel_mottu/features/data/data_sources/services/services_constants.dart';
import 'package:marvel_mottu/features/data/models/result_character_model.dart';
import 'package:marvel_mottu/features/domain/entities/request_pagination_entity.dart';

class CharacterDataSourceImpl implements CharacterDataSource {
  final HttpClient httpClient;

  CharacterDataSourceImpl({required this.httpClient});

  @override
  Future<ResultCharacterModel> getCharacters({
    required RequestPaginationEntity requestPagination,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final hash = generateMd5(
        '$timestamp${MarvelApiKeys.privateKey}${MarvelApiKeys.publicKey}');

    final url = '${MarvelEndpoints.v1Characters}?ts=$timestamp'
        '&apikey=${MarvelApiKeys.publicKey}'
        '&hash=$hash&offset=${requestPagination.offset}'
        '&limit=${requestPagination.limit}';

    final response = await httpClient.get(url);

    if (ServicesConstants.listStatusSuccess.contains(response.statusCode)) {
      try {
        var decodedResponse = json.decode(response.data) as Map;

        return ResultCharacterModel.fromJson(decodedResponse['data']);
      } catch (_) {
        throw const ServerException(
            message:
                'Ocorreu algum problema ao fazer a leitura dos personagens');
      }
    } else {
      throw const ServerException(
          message: 'Não foi possível obter os personagens');
    }
  }
}
