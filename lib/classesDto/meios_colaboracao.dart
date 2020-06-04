class MeioColaboracao{
  int _id;
  String _titulo;
  String _descricao;

  MeioColaboracao();

  MeioColaboracao.init(this._id, this._titulo, this._descricao);

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MeioColaboracao &&
              runtimeType == other.runtimeType &&
              _id == other._id &&
              _titulo == other._titulo &&
              _descricao == other._descricao;

  @override
  int get hashCode => _id.hashCode ^ _titulo.hashCode ^ _descricao.hashCode;

  @override
  String toString() {
    return 'MeioColaboracao{_id: $_id, _titulo: $_titulo, _descricao: $_descricao}';
  }
}