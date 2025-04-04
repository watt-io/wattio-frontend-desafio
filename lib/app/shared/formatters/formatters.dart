class Formatters {
  static String doubleToBRL(double value) {
    //Convertendo para uma string com duas casas decimais
    String stringValue = value.toStringAsFixed(2);

    //Separando as partes inteira de decimal
    List<String> parts = stringValue.split('.');

    //Revertendo a parte inteira para que possamos inserir pontos a cada três dígitos
    String reversedIntPart = parts[0].split('').reversed.join();

    //Insira pontos a cada três dígitos
    String withThousandsSeparator = reversedIntPart.replaceAllMapped(
        RegExp(r'.{3}'), (match) => '${match.group(0)}.');

    String correctlyOrderedIntPart = withThousandsSeparator
        .split('')
        .reversed
        .join()
        .replaceFirst(RegExp(r'^\.'), '');

    //Concatenando as partes inteira e decimal com uma vírgula e adicione o símbolo de Real
    return 'R\$ $correctlyOrderedIntPart,${parts[1]}';
  }

  static String doubleToPercentage(double value) {
    //Multiplique o valor por 100 e converta-o para uma string com duas casas decimais
    String percentageValue = (value * 100).toStringAsFixed(0);

    // Adicione o símbolo de porcentagem ao final
    return '$percentageValue%';
  }

  static String intToBRL(int valor) {
    String valorString = valor.toString();
    String valorReais = '';
    int contador = 0;

    // Adiciona os pontos para cada grupo de três dígitos
    for (int i = valorString.length - 1; i >= 0; i--) {
      valorReais = valorString[i] + valorReais;
      contador++;
      if (contador == 3 && i != 0) {
        valorReais = '.$valorReais';
        contador = 0;
      }
    }

    return 'R\$ $valorReais,00';
  }
}
