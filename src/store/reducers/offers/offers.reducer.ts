import OfferEntity from "@/domain/entities/OfferEntity";
import createSeedOffer from "@/utils/seeds/createSeedOffer";
import { createSlice } from "@reduxjs/toolkit";
import * as reducers from "./offers.actions";

export interface OffersState {
  list: OfferEntity[];
  selected: OfferEntity | null;
}

const initialState: () => OffersState = () => {
  return {
    list: createSeedOffer(1000),
    selected: null,
  };
};

const slice = createSlice<OffersState, typeof reducers, "offers">({
  initialState,
  name: "offers",
  reducers,
});

export const { changeSelected } = slice.actions;

export default slice.reducer;
