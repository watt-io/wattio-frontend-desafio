import { IDatabase } from "./Global";

export interface IPersonEntries {
  person: string;
  energyValue: number;
}

export interface IMainContextProvider {
  personEntries: IPersonEntries;
  setPersonEntries: React.Dispatch<React.SetStateAction<IPersonEntries>>;
  handleSearchOffers: () => void;
  offers: IDatabase[] | undefined
}
