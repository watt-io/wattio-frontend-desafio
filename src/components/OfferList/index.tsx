import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";
import WifiTetheringErrorIcon from "@mui/icons-material/WifiTetheringError";

import OfferEntity from "@/domain/entities/OfferEntity";
import Offer from "./components/Offer";
import OfferSkeleton from "./components/Offer/Skeleton";
import { useTranslation } from "react-i18next";

interface OfferListProps {
  list: OfferEntity[];
  loading?: number | null;
}

const createRangeSkeleton = (limit: number) =>
  [...Array(limit).keys()].map((key) => <OfferSkeleton key={key} />);

const sort = (list: OfferEntity[]) =>
  list.sort((a, b) => (a.economy > b.economy ? -1 : 1));

const OfferList = (props: OfferListProps) => {
  const { t } = useTranslation();

  return (
    <Stack gap="10px" mt="10px" flexDirection="row" flexWrap="wrap">
      {props.loading
        ? createRangeSkeleton(props.loading)
        : sort(props.list).map((offer, index) => {
            return <Offer key={index} index={index + 1} offer={offer} />;
          })}
      {!props.loading && !props.list.length && (
        <Stack
          alignItems="center"
          sx={{
            m: "2rem auto",
            opacity: 0.3,
          }}
        >
          <WifiTetheringErrorIcon sx={{ fontSize: "5rem" }} />
          <Typography maxWidth="250px" textAlign="center">
            {t("empty-no-offers")}
          </Typography>
        </Stack>
      )}
    </Stack>
  );
};

export default OfferList;
