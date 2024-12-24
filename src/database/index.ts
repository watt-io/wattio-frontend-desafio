import { IDatabase } from "../interfaces/Global";

const data: IDatabase[] = [
  {
    name: "EnerFácil",
    description:
      "A Cooperativa Energética EnerFácil oferece energia limpa e renovável para seus cooperados, com um sistema de geração distribuída que permite aos participantes gerarem sua própria energia solar e compartilhá-la com a comunidade.",
    minValue: 1000,
    maxValue: 40000,
    discountNatural: 0.2,
    discountJuridical: 0.22,
    models: ["juridico", "natural"],
  },
  {
    name: "EnerLimpa",
    description:
      "EnerLimpa é uma das maiores do estado, com mais de 50 anos de experiência no mercado. Oferece uma ampla gama de serviços, desde a distribuição de energia elétrica até a comercialização de fontes de energia renovável.",
    minValue: 10000,
    maxValue: 80000,
    discountNatural: 0.25,
    discountJuridical: 0.28,
    models: ["juridical", "natural"],
  },
  {
    name: "EnerGrande",
    description:
      "A Cooperativa de Energia EnerGrande é uma empresa 100% nacional que atua no mercado desde 1998. A cooperativa oferece soluções integradas em energia elétrica e gás natural, com foco em eficiência energética e sustentabilidade.",
    minValue: 40000,
    maxValue: 100000,
    discountNatural: 0.3,
    discountJuridical: 0.33,
    models: ["juridical", "natural"],
  },
  {
    name: "EcoEnergy",
    description:
      "A EcoEnergy Renovável oferece uma opção sustentável para a compra de energia, produzida por fontes renováveis, como sol, vento e água. A cooperativa tem o compromisso de preservar o meio ambiente e contribuir para um futuro mais verde.",
    minValue: 100000,
    maxValue: 285000,
    discountNatural: null,
    discountJuridical: 0.29,
    models: ["juridical"],
  },
  {
    name: "Solaris Power",
    description:
      "A Cooperativa Solaris Power é uma das maiores cooperativas do país, fornecendo energia para mais de 1 milhão de pessoas em todo o estado. Eles se concentram em fornecer energia confiável e de baixo custo para áreas rurais e urbanas, contribuindo para o desenvolvimento das comunidades locais.",
    minValue: 170000,
    maxValue: 750000,
    discountNatural: null,
    discountJuridical: 0.35,
    models: ["juridical"],
  },
  {
    name: "Thunderbolt Energy",
    description:
      "A Thunderbolt Energy é especializada em fornecer soluções solares para residências e empresas. Eles oferecem consultoria, instalação e manutenção de painéis solares para ajudar seus clientes a economizar dinheiro e reduzir sua pegada de carbono.",
    minValue: 350000,
    maxValue: 1000000,
    discountNatural: null,
    discountJuridical: 0.45,
    models: ["juridical"],
  },
  {
    name: "Radiant Electric",
    description:
      "A Radiant Electric é pioneira na geração de energia eólica, utilizando tecnologia avançada para produzir eletricidade a partir do vento. Eles são comprometidos com a sustentabilidade e trabalham para desenvolver fontes de energia limpas e renováveis.",
    minValue: 4000,
    maxValue: 32000,
    discountNatural: 0.19,
    discountJuridical: null,
    models: ["natural"],
  },
  {
    name: "Starlight Energy",
    description:
      "Starlight Energy é uma empresa especializada em gerar eletricidade a partir de recursos hídricos, como rios e barragens. Eles operam em todo o país, fornecendo energia limpa e renovável para comunidades em áreas rurais e urbanas.",
    minValue: 12000,
    maxValue: 18000,
    discountNatural: 0.22,
    discountJuridical: null,
    models: ["natural"],
  },
  {
    name: "BlueWave Power",
    description:
      "A Cooperativa BlueWave Power é uma cooperativa que promove a sustentabilidade e a proteção ambiental. Eles trabalham com seus membros para desenvolver projetos de energia renovável e reduzir o consumo de energia por meio de programas de eficiência energética.",
    minValue: 1000,
    maxValue: 56000,
    discountNatural: 0.24,
    discountJuridical: null,
    models: ["natural"],
  },
];

export default data;
