class PracaDTO {
  int id;
  String nome;
  String telefone;
  String endereco;
  String fundadaem;

  PracaDTO.empty(){
    id = null;
    nome = "";
    telefone = "";
    endereco = "";
    fundadaem = "";
  }

  PracaDTO(this.id, this.nome, this.telefone, this.endereco, this.fundadaem);
}