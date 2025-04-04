import OfferEntity from "@/domain/entities/OfferEntity";
import { PayloadAction } from "@reduxjs/toolkit";
import { OffersState } from "./offers.reducer";

export const changeSelected = (
  state: OffersState,
  { payload }: PayloadAction<OffersState["selected"]>
) => {
  state.selected = payload;
  return state;
};
