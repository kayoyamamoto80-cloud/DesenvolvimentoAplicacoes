import 'Veiculo.dart';

class Carro extends Veiculo {
  int _quantidadePortas = 0;

  Carro(int quantidadePortas, String modelo, String marca, double valorDiaria, int quantidade)
      : super(marca, modelo, valorDiaria, quantidade) {
    this.quantidadePortas = quantidadePortas;
  }

  int get quantidadePortas => _quantidadePortas;
  set quantidadePortas(int qtdPortas) {
    if (qtdPortas <= 0) {
      throw ArgumentError("ERRO: Insira uma quantidade válida de portas");
    }
    _quantidadePortas = qtdPortas;
  }

  @override
  String exibirInformacoes() {
    return "Tipo: Carro\n${super.exibirInformacoes()}\nQuantidade de portas: $_quantidadePortas";
  }
}