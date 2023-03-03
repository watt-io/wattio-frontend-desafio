import { useMemo, useState } from "react";
import { useTranslation } from "react-i18next";

import Container from "@mui/material/Container";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";
import useMediaQuery from "@mui/material/useMediaQuery";
import LocalOfferOutlinedIcon from "@mui/icons-material/LocalOfferOutlined";

import Theming from "./components/Theming";
import Header from "./components/Header";
import OfferList from "./components/OfferList";
import OfferControl from "./components/OfferControl";
import DrawerSettings from "./components/DrawerSettings";
import { getOffers } from "./store/reducers/offers/offers.hooks";
import logoWattio from "@/assets/images/icons/wattio.png";
import useInstallApp from "./hooks/useInstallApp";

function App() {
  const { t } = useTranslation();
  const showLeftHeader = useMediaQuery("(min-width:1200px)");
  const offers = getOffers();
  const [rangeAmount, setRangeAmount] = useState(1000);
  const [isWaitingChanges, setIsWaitingChanges] = useState(false);

  const offerList = useMemo(() => {
    return offers.list.filter(
      (offer) =>
        rangeAmount > offer.minMonthly && rangeAmount < offer.maxMonthly
    );
  }, [rangeAmount]);

  useInstallApp();

  return (
    <Theming>
      <Stack flexDirection={showLeftHeader ? "row" : "column"}>
        {showLeftHeader ? (
          <Header />
        ) : (
          <Container>
            <Stack
              flexDirection="row"
              sx={{
                alignItems: "center",
                justifyContent: "center",
                gap: 1,
                img: {
                  width: 40,
                },
              }}
            >
              <div>
                <img src={logoWattio} />
              </div>
              <Typography
                variant="h1"
                fontWeight="bold"
                fontSize="2rem"
                my="1rem"
              >
                {t("main-title")}
              </Typography>
            </Stack>
          </Container>
        )}
        <Container
          maxWidth="lg"
          sx={
            showLeftHeader
              ? {
                  maxHeight: "100vh",
                  py: 1,
                  overflow: "auto",
                }
              : { py: 1, maxHeight: "auto", overflow: "initial" }
          }
        >
          <OfferControl
            value={rangeAmount}
            onChange={setRangeAmount}
            isWaitingChange={isWaitingChanges}
            onWaitingChange={setIsWaitingChanges}
          />
          <Stack>
            <Stack flexDirection="row" mb="0.5rem" mt="2rem" gap="0.5rem">
              <LocalOfferOutlinedIcon />
              <Typography>{t("offers")}</Typography>
            </Stack>
            <OfferList
              list={offerList}
              loading={isWaitingChanges ? offerList.length : null}
            />
          </Stack>
        </Container>
        <DrawerSettings />
      </Stack>
    </Theming>
  );
}

export default App;
