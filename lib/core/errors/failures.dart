import 'package:equatable/equatable.dart';

// Definição da classe abstrata Failure que estende a classe Equatable
abstract class Failure extends Equatable {
  // Declaração da propriedade message que pode ser uma mensagem de erro
  String? message;
}

// Definição da classe ServerFailure que estende a classe Failure
class ServerFailure extends Failure {
  // Declaração da propriedade message, que pode ser uma mensagem de erro opcional
  @override
  final String? message;

  // Construtor da classe ServerFailure, que recebe um parâmetro opcional message
  ServerFailure({this.message});

  // Implementação do método props da classe Equatable, que retorna uma lista de propriedades que devem ser consideradas para comparação
  @override
  List<Object?> get props => [message];
}
