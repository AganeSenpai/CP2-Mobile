//Pedido da Loja

class ItemPedido {
  final String nome;
  final double preco;
  final int quantidade;

  ItemPedido({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  void exibirLinha() {
    double subtotalItem = preco * quantidade;
    print(
      "$quantidade x $nome (R\$ ${preco.toStringAsFixed(2)}) = R\$ ${subtotalItem.toStringAsFixed(2)}",
    );
  }
}

class Pedido {
  final String cliente;
  final List<ItemPedido> itens = [];

  Pedido(this.cliente);

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  void mostrarResumo() {
    print("Pedido de $cliente");
    double subtotalGeral = 0;

    for (var item in itens) {
      item.exibirLinha();
      subtotalGeral += item.preco * item.quantidade;
    }

    print("Subtotal: R\$ ${subtotalGeral.toStringAsFixed(2)}");

    double desconto = 0;

    if (subtotalGeral > 200.00) {
      desconto = subtotalGeral * 0.10;
      print("Desconto (10%): R\$ ${desconto.toStringAsFixed(2)}");
    }

    double totalPagar = subtotalGeral - desconto;
    print("Total a pagar: R\$ ${totalPagar.toStringAsFixed(2)}");
  }
}

void main() {

  Pedido pedido = Pedido('Carla');
  
  pedido.adicionarItem(
    ItemPedido(nome: 'Teclado', preco: 150.00, quantidade: 1),
  );
  pedido.adicionarItem(ItemPedido(nome: 'Mouse', preco: 89.90, quantidade: 2));
  pedido.adicionarItem(
    ItemPedido(nome: 'Mousepad', preco: 35.50, quantidade: 1),
  );

  pedido.mostrarResumo();
}
