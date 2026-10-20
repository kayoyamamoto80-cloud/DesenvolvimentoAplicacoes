import 'dart:io';
import 'package:desafio_locadora/Veiculo.dart';
import 'package:desafio_locadora/Carro.dart';
import 'package:desafio_locadora/Moto.dart';

void main() {
  List<Veiculo> veiculos = [];
  int opcao = -1;

  do {
    print(
        '\nMenu Locadora\n1- Cadastrar carro\n2- Cadastrar moto\n3- Listar veículos\n4- Editar veículo\n5- Excluir veículo\n6- Alugar veículo\n0- Sair');
    stdout.write('Escolha uma opção: ');

    String? entrada = stdin.readLineSync();
    opcao = int.tryParse(entrada ?? '') ?? -1;

    switch (opcao) {
      case 1:
        cadastrarCarro(veiculos);
        break;
      case 2:
        cadastrarMoto(veiculos);
        break;
      case 3:
        listarVeiculos(veiculos);
        break;
      case 4:
        editarVeiculo(veiculos);
        break;
      case 5:
        excluirVeiculo(veiculos);
        break;
      case 6:
        if (veiculos.isEmpty) {
          print("Não há veículos cadastrados.");
          break;
        }

        print("\n--- Lista de Veículos ---");
        for (int i = 0; i < veiculos.length; i++) {
          print("Posição $i:");
          print(veiculos[i].exibirInformacoes());
          print("-------------------------");
        }

        stdout.write("Informe a posição do veículo: ");
        int? pos = int.tryParse(stdin.readLineSync() ?? '');

        if (pos == null || pos < 0 || pos >= veiculos.length) {
          print("Posição inválida!");
          break;
        }

        stdout.write("Informe a quantidade de dias: ");
        int? dias = int.tryParse(stdin.readLineSync() ?? '');

        if (dias == null) {
          print("Entrada inválida para dias!");
          break;
        }

        var veiculo = veiculos[pos];

        try {
          double valorTotal = veiculo.alugar(dias);

          print("\n--- Aluguel Concluído com Sucesso ---");
          print("Veículo: ${veiculo.Modelo}");
          print("Valor da diária: R\$ ${veiculo.valorDiaria.toStringAsFixed(2)}");
          print("Quantidade de dias: $dias");
          print("Valor total do aluguel: R\$ ${valorTotal.toStringAsFixed(2)}");
          print("Quantidade disponível após o aluguel: ${veiculo.Quantidade}");
        } catch (e) {
          print(e.toString().replaceAll("ArgumentError: ", "").replaceAll("StateError: ", ""));
        }
        break;
      case 0:
        print("Encerrando programa...");
        break;
      default:
        print('Opção inválida!');
    }
  } while (opcao != 0);
}

void cadastrarCarro(List<Veiculo> veiculos) {
  try {
    stdout.write('Marca: ');
    String marca = stdin.readLineSync() ?? '';

    stdout.write('Modelo: ');
    String modelo = stdin.readLineSync() ?? '';

    stdout.write('Valor da diária: ');
    double valorDiaria = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Quantidade de portas: ');
    int portas = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Quantidade: ');
    int quantidade = int.parse(stdin.readLineSync() ?? '0');

    Carro carro = Carro(portas, modelo, marca, valorDiaria, quantidade);
    veiculos.add(carro);
    print('Carro cadastrado com sucesso!');
  } catch (e) {
    print('Erro: $e');
  }
}

void cadastrarMoto(List<Veiculo> veiculos) {
  try {
    stdout.write('Marca: ');
    String marca = stdin.readLineSync() ?? '';

    stdout.write('Modelo: ');
    String modelo = stdin.readLineSync() ?? '';

    stdout.write('Valor da diária: ');
    double valorDiaria = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Cilindradas: ');
    int cilindradas = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Quantidade: ');
    int quantidade = int.parse(stdin.readLineSync() ?? '0');

    Moto moto = Moto(marca, modelo, valorDiaria, cilindradas, quantidade);
    veiculos.add(moto);
    print('Moto cadastrada com sucesso!');
  } catch (e) {
    print('Erro: $e');
  }
}

void listarVeiculos(List<Veiculo> veiculos) {
  if (veiculos.isEmpty) {
    print('Nenhum veículo cadastrado.');
    return;
  }

  for (int i = 0; i < veiculos.length; i++) {
    Veiculo v = veiculos[i];
    print('\n[Posição $i]');
    print(v.exibirInformacoes());
  }
}

void editarVeiculo(List<Veiculo> veiculos) {
  if (veiculos.isEmpty) {
    print('Nenhum veículo cadastrado.');
    return;
  }

  listarVeiculos(veiculos);
  stdout.write('\nDigite a posição do veículo que deseja editar: ');
  int posicao = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (posicao < 0 || posicao >= veiculos.length) {
    print('Posição inválida!');
    return;
  }

  try {
    stdout.write('Nova Marca: ');
    String novaMarca = stdin.readLineSync() ?? '';

    stdout.write('Novo Modelo: ');
    String novoModelo = stdin.readLineSync() ?? '';

    stdout.write('Novo Valor da diária: ');
    double novoValor = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Nova Quantidade: ');
    int novaQuantidade = int.parse(stdin.readLineSync() ?? '0');

    veiculos[posicao].marca = novaMarca;
    veiculos[posicao].Modelo = novoModelo;
    veiculos[posicao].valorDiaria = novoValor;
    veiculos[posicao].Quantidade = novaQuantidade;

    print('Veículo editado com sucesso!');
  } catch (e) {
    print('Erro ao editar: $e');
  }
}

void excluirVeiculo(List<Veiculo> veiculos) {
  if (veiculos.isEmpty) {
    print('Nenhum veículo cadastrado.');
    return;
  }

  listarVeiculos(veiculos);
  stdout.write('\nDigite a posição do veículo que deseja excluir: ');
  int posicao = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (posicao < 0 || posicao >= veiculos.length) {
    print('Posição inválida!');
    return;
  }

  veiculos.removeAt(posicao);
  print('Veículo removido com sucesso!');
}