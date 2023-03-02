export interface IModalEconomyState {
  name: string;
  discountValue: number;
  mensalEconomy: number;
  open: boolean;
}

export interface IModalCompanyProps {
  name: string;
  discountJuridical: number;
  discountNatural: number;
}

export interface IModalEconomyStateProps {
  state: IModalEconomyState;
  setState: React.Dispatch<React.SetStateAction<IModalEconomyState>>;
}

export interface IModalTitleProps {
  id: string;
  children?: React.ReactNode;
  onClose: () => void;
}
