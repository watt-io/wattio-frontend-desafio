import { IDatabase } from "../interfaces/Global";

const data: IDatabase[] = [
  {
    name: "EnerFácil",
    minValue: 1000,
    maxValue: 40000,
    discountNatural: 0.2,
    discountJuridical: 0.22,
    models: ["juridico", "natural"],
  },
  {
    name: "EnerLimpa",
    minValue: 10000,
    maxValue: 80000,
    discountNatural: 0.25,
    discountJuridical: 0.28,
    models: ["juridical", "natural"],
  },
  {
    name: "EnerGrande",
    minValue: 40000,
    maxValue: 100000,
    discountNatural: 0.3,
    discountJuridical: 0.33,
    models: ["juridical", "natural"],
  },
  {
    name: "EcoEnergy",
    minValue: 100000,
    maxValue: 285000,
    discountNatural: null,
    discountJuridical: 0.29,
    models: ["juridical"],
  },
  {
    name: "Solaris Power",
    minValue: 170000,
    maxValue: 500000,
    discountNatural: null,
    discountJuridical: 0.35,
    models: ["juridical"],
  },
  {
    name: "Thunderbolt Energy",
    minValue: 350000,
    maxValue: 1000000,
    discountNatural: null,
    discountJuridical: 0.45,
    models: ["juridical"],
  },
  {
    name: "Radiant Electric",
    minValue: 4000,
    maxValue: 32000,
    discountNatural: 0.19,
    discountJuridical: null,
    models: ["natural"],
  },
  {
    name: "Starlight Energy",
    minValue: 12000,
    maxValue: 18000,
    discountNatural: 0.22,
    discountJuridical: null,
    models: ["natural"],
  },
  {
    name: "BlueWave Power",
    minValue: 1000,
    maxValue: 56000,
    discountNatural: 0.24,
    discountJuridical: null,
    models: ["natural"],
  },
];

export default data;
