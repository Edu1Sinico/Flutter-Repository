class Produto{
  int id;
  String nome;
  String descricao;
  int qtde;
  String foto;
  double preco;
  List<dynamic> categoria;

  //Construtor
  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.qtde,
    required this.foto,
    required this.preco,
    required this.categoria,
  });
  
}