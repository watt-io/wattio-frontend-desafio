export interface IChildrenNode {
  children: React.ReactNode;
}

export interface IDatabase {
  name: string;
  minValue: number;
  maxValue: number;
  discountNatural: number | null;
  discountJuridical: number | null;
  models: string[];
}
