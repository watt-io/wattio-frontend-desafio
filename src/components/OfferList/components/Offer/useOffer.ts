import OfferEntity from "@/domain/entities/OfferEntity";
import {
  getOffers,
  useSetOfferSelected,
} from "@/store/reducers/offers/offers.hooks";
import { useState } from "react";

export interface ListOffersProps {
  index: number;
  offer: OfferEntity;
}

const useOffer = (props: ListOffersProps) => {
  const setOfferSelected = useSetOfferSelected();
  const { selected } = getOffers();
  const [hover, setHover] = useState(false);
  const economyPercent = Math.round(props.offer.economy * 100);
  const isChecked = selected && selected.id === props.offer.id;

  return {
    state: {
      selected,
      hover,
    },
    methods: {
      setOfferSelected,
      setHover,
    },
    data: {
      economyPercent,
      isChecked,
    },
  };
};

export default useOffer;
