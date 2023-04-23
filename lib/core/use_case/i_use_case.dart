import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_mottu/core/errors/failures.dart';

abstract class IUseCase<Output, Input> {
  // Define um método abstrato que deve ser implementado nas classes que herdam dessa classe abstrata.
  // O método recebe um objeto do tipo Input e retorna um objeto do tipo Future<Either<Failure, Output>>.
  Future<Either<Failure, Output>> call({required Input requestPagination});
}

// Define uma classe que representa um parâmetro nulo.
// Essa classe é usada como um parâmetro padrão para um caso de uso que não requer argumentos.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
