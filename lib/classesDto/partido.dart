class Partido {
  int _id;
  int _numero;
  String _sigla;
  String _descricao;

  Partido();

  Partido.init(this._id, this._numero, this._sigla, this._descricao);

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get sigla => _sigla;

  set sigla(String value) {
    _sigla = value;
  }

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Partido &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _numero == other._numero &&
          _sigla == other._sigla &&
          _descricao == other._descricao;

  @override
  int get hashCode =>
      _id.hashCode ^ _numero.hashCode ^ _sigla.hashCode ^ _descricao.hashCode;

  @override
  String toString() {
    return 'Partido{_id: $_id, _numero: $_numero, _sigla: $_sigla, _descricao: $_descricao}';
  }
}