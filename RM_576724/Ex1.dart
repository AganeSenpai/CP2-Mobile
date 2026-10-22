//Ficha de pet

class Pet {
  String nome;
  String especie;
  int idade;
  double peso;

  Pet(this.nome, this.especie, this.idade, this.peso);

  void exibirFicha() {
    String faixaEtaria;
    if (idade <= 1) {
      faixaEtaria = "Filhote";
    } else if (idade <= 7) {
      faixaEtaria = "Adulto";
    } else {
      faixaEtaria = "Idoso";
    }
    print(
      "$nome ($especie) - $idade anos - ${peso.toStringAsFixed(1)} kg - $faixaEtaria",
    );
  }

  void fazerAniversario() {
    idade += 1;
    print("Feliz aniversário, $nome! Agora com $idade anos.");
  }
}

void main() {

  List<Pet> pets = [
    Pet('Thor', 'Cachorro', 3, 28.5),
    Pet('Mia', 'Gato', 1, 4.2),
    Pet('Bob', 'Cachorro', 9, 12.0),
    Pet('Nina', 'Coelho', 2, 1.8),
  ];

  for (var pet in pets) {
    pet.exibirFicha();
  }

  pets[1].fazerAniversario();
  pets[1].exibirFicha();

  Pet petMaisPesado = pets[0];
  for (var pet in pets) {
    if (pet.peso > petMaisPesado.peso) {
      petMaisPesado = pet;
    }
  }

  print(
    "Pet mais pesado: ${petMaisPesado.nome} (${petMaisPesado.peso.toStringAsFixed(1)} kg)",
  );
}
