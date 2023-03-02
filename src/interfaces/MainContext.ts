import { IDatabase } from "./Global";
import { IModalCompanyProps, IModalEconomyState } from "./Modal";

export interface IPersonEntries {
  person: string;
  energyValue: number;
}

export interface IMainContextProvider {
  personEntries: IPersonEntries;
  setPersonEntries: React.Dispatch<React.SetStateAction<IPersonEntries>>;
  handleSearchOffers: () => void;
  offers: IDatabase[] | undefined;
  handleOpenModal: (
    company: IModalCompanyProps,
    person: IPersonEntries
  ) => void;
  modalData: IModalEconomyState;
  setModalData: React.Dispatch<React.SetStateAction<IModalEconomyState>>;
}
