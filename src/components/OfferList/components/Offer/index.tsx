import { useTranslation } from "react-i18next";
import Divider from "@mui/material/Divider";
import Paper from "@mui/material/Paper";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";

import CheckBoxIcon from "@mui/icons-material/CheckBox";
import CheckBoxOutlineBlankIcon from "@mui/icons-material/CheckBoxOutlineBlank";

import CircularProgressWithLabel from "@/shared/components/ProgressBarLabel";
import useOffer, { ListOffersProps } from "./useOffer";

const Offer = (props: ListOffersProps) => {
  const { t } = useTranslation();
  const { data, methods, state } = useOffer(props);

  return (
    <Paper
      onMouseLeave={() => methods.setHover(false)}
      onMouseMove={() => methods.setHover(true)}
      onClick={() => {
        if (data.isChecked) {
          methods.setOfferSelected(null);
          return;
        }
        methods.setOfferSelected(props.offer);
      }}
      sx={{
        p: 2,
        gap: "10rem",
        display: "flex",
        flexDirection: "column",
        flex: 1,
        minWidth: 270,
        position: "relative",
        transition: "linear 0.2s",
        cursor: "pointer",
        border: "solid 1px",
        borderColor: data.isChecked ? "primary.main" : "transparent",
        "&:hover": {
          backgroundColor: "custom.boxHover",
          transform: "scale(1.01)",
          borderColor: data.isChecked ? "primary.200" : "transparent",
        },
      }}
    >
      <Stack gap="0.5rem">
        <Stack flexDirection="row" justifyContent="space-between">
          <Stack flexDirection="row" alignItems="center">
            {data.isChecked ? (
              <CheckBoxIcon
                sx={{
                  width: state.hover || data.isChecked ? 20 : 0,
                  mr: state.hover || data.isChecked ? 1 : 0,
                  transition: "linear 0.4s",
                  color: data.isChecked ? "primary.main" : "",
                }}
              />
            ) : (
              <CheckBoxOutlineBlankIcon
                sx={{
                  width: state.hover || data.isChecked ? 20 : 0,
                  mr: state.hover || data.isChecked ? 1 : 0,
                  transition: "linear 0.4s",
                }}
              />
            )}
            <Typography fontSize="1.5rem" fontWeight="bold">
              # {t("offer-number", { number: props.index })}
            </Typography>
          </Stack>
          <div>
            <CircularProgressWithLabel
              variant="determinate"
              value={data.economyPercent}
              size="2rem"
            />
          </div>
        </Stack>
        <Divider variant="fullWidth" orientation="horizontal" flexItem />
        <Stack flexDirection="row" gap="1rem">
          <Typography fontWeight="500" minWidth="120px">
            {t("cooperative")}
          </Typography>
          <Typography fontWeight="500">{t("economics")}</Typography>
        </Stack>
        <Divider variant="fullWidth" orientation="horizontal" flexItem />
        <Stack flexDirection="row" gap="1rem">
          <Typography fontWeight="400" minWidth="120px">
            {props.offer.name}
          </Typography>
          <Typography fontWeight="400">
            {t("rate-of-percent", {
              percent: data.economyPercent,
            })}
          </Typography>
        </Stack>
      </Stack>
    </Paper>
  );
};

export default Offer;
