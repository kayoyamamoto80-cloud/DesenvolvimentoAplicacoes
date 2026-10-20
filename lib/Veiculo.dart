class Veiculo {
  String _marca = "";
  String _modelo = "";
  double _valorDiaria = 0;
  int _quantidade = 0;

  Veiculo(String marca, String modelo, double valorDiaria, int quantidade) {
    this.marca = marca;
    Modelo = modelo;
    this.valorDiaria = valorDiaria;
    Quantidade = quantidade;
  }

  String get marca => _marca;
  set marca(String novaMarca) {
    if (novaMarca.trim().isEmpty) {
      throw ArgumentError("ERRO: Insira a marca do veículo!");
    }
    _marca = novaMarca;
  }

  String get Modelo => _modelo;
  set Modelo(String novoModelo) {
    if (novoModelo.trim().isEmpty) {
      throw ArgumentError("ERRO: Insira o modelo do veículo!");
    }
    _modelo = novoModelo;
  }

  double get valorDiaria => _valorDiaria;
  set valorDiaria(double novoValorDiaria) {
    if (novoValorDiaria <= 0) {
      throw ArgumentError("ERRO: Digite o valor da diária!");
    }
    _valorDiaria = novoValorDiaria;
  }

  int get Quantidade => _quantidade;
  set Quantidade(int novaQuantidade) {
    if (novaQuantidade < 0) {
      throw ArgumentError("ERRO: não pode ter quantidade negativa");
    }
    _quantidade = novaQuantidade;
  }

  String exibirInformacoes() {
    return "Marca: $_marca\nModelo: $_modelo\nValor da diária: R\$ ${_valorDiaria.toStringAsFixed(2)}\nQuantidade disponível: $_quantidade";
  }

  double alugar(int dias) {
    if (dias <= 0) {
      throw ArgumentError("ERRO: quantidade de dias não pode ser de 0 para baixo.");
    }
    if (_quantidade <= 0) {
      throw StateError("ERRO: não há unidades disponíveis");
    }

    double valorTotal = _valorDiaria * dias;
    _quantidade--;

    return valorTotal;
  }
}