import Paper from "@mui/material/Paper";
import Slider from "@mui/material/Slider";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";
import Box from "@mui/material/Box";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";

import parseToCurrencyBRL from "@/utils/parseToCurrencyBRL";
import { useTranslation } from "react-i18next";
import { CurrencyInput } from "./styles";
import useOfferControl, { OfferControlProps } from "./useOfferControl";

const OfferControl = (props: OfferControlProps) => {
  const { t } = useTranslation();
  const { state, data, methods } = useOfferControl(props);
  return (
    <Paper
      sx={{
        p: 3,
        py: 5,
        borderRadius: 4,
        display: "flex",
        flexDirection: "row",
        "@media(max-width: 550px)": {
          flexDirection: "column-reverse",
          gap: 1,
        },
        position: "relative",
      }}
    >
      <Stack flex="1" gap="5px" alignItems="flex-start">
        <Box
          sx={{
            backgroundColor: "primary.main",
            p: "0.5rem 1rem",
            borderRadius: 100,
          }}
        >
          <Typography
            fontSize="1rem"
            fontWeight="bold"
            textTransform="uppercase"
            sx={{
              transition: "linear 0.4s",
              "@media(max-width: 800px)": {
                fontSize: "0.8rem",
              },
            }}
          >
            {t("average-monthly-value")}
          </Typography>
        </Box>
        <Stack flexDirection="row" gap="0.5rem" alignItems="center">
          <Typography
            variant="h1"
            fontWeight="500"
            fontSize="3rem"
            sx={{
              transition: "linear 0.4s",
              "@media(max-width: 800px)": {
                fontSize: "2.5rem",
              },
            }}
          >
            R$
          </Typography>
          <CurrencyInput
            value={state.amountText}
            onChange={(event) => {
              const { value } = event.target;
              const ignore = ["\\d", ","].join("");
              const regex = new RegExp(`[^${ignore}]`, "g");
              const rawNumber = value.replace(regex, "");
              methods.setAmountText(rawNumber);
            }}
            placeholder="1.000,00"
          />
        </Stack>
        <Slider
          data-testid="range"
          value={state.amountRange}
          onChange={(event, value) => {
            methods.setAmountRange(value as number);
          }}
          color="primary"
          sx={{ width: "100%" }}
          min={1000}
          max={1e5}
        />
      </Stack>
      {data.isMobile ? (
        <Divider orientation="horizontal" variant="fullWidth" flexItem />
      ) : (
        <Divider
          sx={{ mx: 2 }}
          orientation="vertical"
          variant="fullWidth"
          flexItem
        />
      )}

      <Stack flex="0.5" alignItems="flex-start" gap="0.5rem" minWidth="300px">
        <Box
          sx={{
            backgroundColor: "primary.main",
            p: "0.5rem 1rem",
            borderRadius: 100,
          }}
        >
          <Typography
            fontSize="1rem"
            fontWeight="bold"
            textTransform="uppercase"
            sx={{
              transition: "linear 0.4s",
              "@media(max-width: 800px)": {
                fontSize: "0.8rem",
              },
            }}
          >
            {t("yearly-savings")}
          </Typography>
        </Box>
        <Typography
          variant="h1"
          fontWeight="bold"
          fontSize="3rem"
          sx={{
            transition: "linear 0.4s",
            "@media(max-width: 800px)": {
              fontSize: "2rem",
            },
          }}
        >
          {parseToCurrencyBRL(data.yearlyPercent)}
        </Typography>
        <Stack flexDirection="row" alignItems="center" gap="0.5rem">
          <Typography
            variant="h2"
            fontWeight="bold"
            fontSize="1.5rem"
            sx={{
              transition: "linear 0.4s",
              "@media(max-width: 800px)": {
                fontSize: "1rem",
              },
            }}
          >
            {parseToCurrencyBRL(data.monthlyPercent)}
          </Typography>
          <Box
            sx={{
              backgroundColor: "primary.main",
              p: "0.5rem 1rem",
              borderRadius: 100,
            }}
          >
            <Typography
              fontSize="1rem"
              fontWeight="bold"
              textTransform="uppercase"
              sx={{
                transition: "linear 0.4s",
                "@media(max-width: 800px)": {
                  fontSize: "0.8rem",
                },
              }}
            >
              {t("per-month")}
            </Typography>
          </Box>
        </Stack>
        <Stack width="100%">
          <Button
            onClick={methods.notify(t("successfully-acquired"))}
            disabled={!state.selected}
            variant="outlined"
            data-testid="hire-button"
          >
            {t("hire")}
          </Button>
        </Stack>
      </Stack>
    </Paper>
  );
};

export default OfferControl;
