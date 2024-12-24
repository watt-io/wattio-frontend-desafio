import { IDatabase } from "./Global";
import { IModalCompanyProps, IModalEconomyState } from "./Modal";

export interface IProposalForm {
  to_name: string;
  to_email: string;
}

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
  sendEmail: (data: IProposalForm) => Promise<void>;
  loading: boolean;
  setLoading: React.Dispatch<React.SetStateAction<boolean>>;
}
