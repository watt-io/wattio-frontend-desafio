import { AppDispatch, RootStore } from "@/store";
import { useDispatch, useSelector } from "react-redux";
import { changeSelected, OffersState } from "./offers.reducer";

export const getOffers = () => {
  const offers = useSelector<RootStore, OffersState>((state) => state.offers);
  return offers;
};

export const useSetOfferSelected = () => {
  const dispatch = useDispatch<AppDispatch>();
  return (selected: OffersState["selected"]) =>
    dispatch(changeSelected(selected));
};
