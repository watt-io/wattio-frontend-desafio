// ignore_for_file: public_member_api_docs, sort_constructors_first
class State {
  final String acronym;
  final String name;

  State({required this.acronym, required this.name});

  @override
  String toString() => '$name - $acronym';

  @override
  bool operator ==(covariant State other) {
    if (identical(this, other)) return true;
  
    return 
      other.acronym == acronym &&
      other.name == name;
  }

  @override
  int get hashCode => acronym.hashCode ^ name.hashCode;
}

class BrazilianStates {
  static List<State> getStateList() {
    return [
      State(acronym: 'AC', name: 'Acre'),
      State(acronym: 'AL', name: 'Alagoas'),
      State(acronym: 'AP', name: 'Amapá'),
      State(acronym: 'AM', name: 'Amazonas'),
      State(acronym: 'BA', name: 'Bahia'),
      State(acronym: 'CE', name: 'Ceará'),
      State(acronym: 'DF', name: 'Distrito Federal'),
      State(acronym: 'ES', name: 'Espírito Santo'),
      State(acronym: 'GO', name: 'Goiás'),
      State(acronym: 'MA', name: 'Maranhão'),
      State(acronym: 'MT', name: 'Mato Grosso'),
      State(acronym: 'MS', name: 'Mato Grosso do Sul'),
      State(acronym: 'MG', name: 'Minas Gerais'),
      State(acronym: 'PA', name: 'Pará'),
      State(acronym: 'PB', name: 'Paraíba'),
      State(acronym: 'PR', name: 'Paraná'),
      State(acronym: 'PE', name: 'Pernambuco'),
      State(acronym: 'PI', name: 'Piauí'),
      State(acronym: 'RJ', name: 'Rio de Janeiro'),
      State(acronym: 'RN', name: 'Rio Grande do Norte'),
      State(acronym: 'RS', name: 'Rio Grande do Sul'),
      State(acronym: 'RO', name: 'Rondônia'),
      State(acronym: 'RR', name: 'Roraima'),
      State(acronym: 'SC', name: 'Santa Catarina'),
      State(acronym: 'SP', name: 'São Paulo'),
      State(acronym: 'SE', name: 'Sergipe'),
      State(acronym: 'TO', name: 'Tocantins'),
    ];
  }
}
