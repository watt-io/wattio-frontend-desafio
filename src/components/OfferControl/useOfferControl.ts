import { useState } from "react";
import useMediaQuery from "@mui/material/useMediaQuery";
import { useSnackbar } from "notistack";
import useDebounce from "@/hooks/useDebounce";
import {
  getOffers,
  useSetOfferSelected,
} from "@/store/reducers/offers/offers.hooks";

export interface OfferControlProps {
  value: number;
  onChange(size: number): void;
  isWaitingChange: boolean;
  onWaitingChange(status: boolean): void;
}

const useOfferControl = (props: OfferControlProps) => {
  const isMobile = useMediaQuery("(max-width: 550px)");
  const { enqueueSnackbar } = useSnackbar();
  const { selected } = getOffers();
  const setOfferSelected = useSetOfferSelected();
  const [amountRange, setAmountRange] = useState(props.value);
  const [amountText, setAmountText] = useState(String(props.value));
  const amountTextToNumber = +amountText.replace(",", ".");

  useDebounce(
    {
      before() {
        setAmountText(String(amountRange).replace(".", ","));
        if (!props.isWaitingChange) props.onWaitingChange(true);
        if (selected) setOfferSelected(null);
      },
      after() {
        props.onWaitingChange(false);
        props.onChange(amountRange);
      },
    },
    [amountRange]
  );

  useDebounce(
    {
      before() {
        if (!props.isWaitingChange) props.onWaitingChange(true);
        if (selected) setOfferSelected(null);
      },
      after() {
        const max = amountTextToNumber > 1e5;
        const min = amountTextToNumber < 1e3;
        if (max) {
          setAmountText(String(1e5));
          setAmountRange(1e5);
        } else if (min) {
          setAmountText(String(1e3));
          setAmountRange(1e3);
        } else setAmountRange(amountTextToNumber);
        props.onWaitingChange(false);
      },
      wait: 800,
    },
    [amountText]
  );

  const economyPercent = (selected?.economy ?? 0) * 100;
  const monthlyPercent = (amountRange / 100) * economyPercent;
  const yearlyPercent = monthlyPercent * 12;

  const notify = (text: string) => () =>
    enqueueSnackbar(text, {
      variant: "success",
      anchorOrigin: { horizontal: "right", vertical: "top" },
    });

  return {
    state: {
      amountRange,
      amountText,
      selected,
    },
    data: {
      amountTextToNumber,
      isMobile,
      economyPercent,
      monthlyPercent,
      yearlyPercent,
    },
    methods: {
      setOfferSelected,
      setAmountText,
      setAmountRange,
      notify,
    },
  };
};

export default useOfferControl;
