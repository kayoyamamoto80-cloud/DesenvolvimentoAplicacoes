import 'Veiculo.dart';

class Moto extends Veiculo {
  int _cilindradas = 0;

  Moto(String marca, String modelo, double valorDiaria, int cilindradas, int quantidade)
      : super(marca, modelo, valorDiaria, quantidade) {
    Cilindradas = cilindradas;
  }

  int get Cilindradas => _cilindradas;
  set Cilindradas(int cilindrada) {
    if (cilindrada <= 0) {
      throw ArgumentError("ERRO: Digite uma quantidade válida de cilindradas");
    }
    _cilindradas = cilindrada;
  }

  @override
  String exibirInformacoes() {
    return "Tipo: Moto\n${super.exibirInformacoes()}\nCilindradas: $_cilindradas";
  }
}