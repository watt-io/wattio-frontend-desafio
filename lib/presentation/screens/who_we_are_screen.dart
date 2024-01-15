import 'package:flutter/material.dart';

class WhoWeAreScreen extends StatelessWidget {
  const WhoWeAreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Iniciativa: Empoderando Consumidores através das Cooperativas de Energia",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
                "No Brasil, uma crescente iniciativa tem revolucionado o modo como as pessoas consomem energia. Agora, é possível gerar a própria eletricidade, afastando-se das tradicionais distribuidoras como CEMIG, Energia, CPFL, entre outras. Este movimento não apenas oferece autonomia energética, mas também proporciona significativas economias nas contas mensais de residências e empresas."),
            Text(
                "Embora as placas de energia solar tenham se popularizado, a instalação de sistemas próprios ainda é uma realidade acessível a poucos. No entanto, uma solução inovadora tem se destacado: a possibilidade de adquirir energia diretamente de usinas locais a preços mais vantajosos do que os praticados pelas distribuidoras convencionais."),
            Text(
                "A chave para essa transformação reside nas Cooperativas de Energia. Estas entidades atuam como intermediárias, adquirindo o excedente de energia de usinas e de outras residências e empresas com sistemas de geração própria. Posteriormente, comercializam essa energia a consumidores a preços mais competitivos em comparação com as tarifas das distribuidoras tradicionais."),
            Text(
                "Apesar dos benefícios evidentes, o desconhecimento sobre as Cooperativas de Energia ainda persiste entre os consumidores. Poucos estão cientes das empresas que se autodenominam como cooperativas e do papel crucial que desempenham no novo mercado energético. A falta de informação torna desafiador para os consumidores entenderem como podem se beneficiar dessas iniciativas."),
            Text(
                "Além disso, a ausência de uma ferramenta unificada para pesquisar e comparar as diferentes ofertas na região dificulta a tomada de decisão. Os consumidores se veem diante da incerteza sobre qual cooperativa escolher para atender às suas necessidades específicas, tornando essencial a criação de ferramentas que facilitem essa busca e comparação."),
            Text(
                "Dessa forma, ao conscientizar a população sobre as Cooperativas de Energia e proporcionar meios eficazes de pesquisa e comparação, essa iniciativa visa empoderar os consumidores, permitindo-lhes fazer escolhas informadas e usufruir de uma energia mais acessível, sustentável e alinhada com suas necessidades individuais e comerciais."),
          ],
        ),
      ),
    );
  }
}
