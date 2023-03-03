import Stack from "@mui/material/Stack";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import RadioButtonCheckedOutlinedIcon from "@mui/icons-material/RadioButtonCheckedOutlined";

import wattioLogo from "@/assets/images/logos/WATTio-logo.png";
import { useTranslation } from "react-i18next";

const Header = () => {
  const { t } = useTranslation();

  const points = [...Array(4).keys()].map(
    (key) => `positive-points.point-${key}`
  );

  return (
    <Paper
      sx={{
        py: "30px",
        p: 2,
        borderRadius: "0 30px 30px 0",
        maxWidth: 400,
        display: "flex",
        alignItems: "flex-start",
        flexDirection: "column",
        justifyContent: "center",
        minHeight: "100vh",
      }}
    >
      <Stack
        sx={{
          alignItems: "flex-start",
          justifyContent: "space-around",
          flexDirection: "column",
          height: "100%",
          maxHeight: 700,
        }}
      >
        <Typography variant="h1" fontWeight="bold" fontSize="3.5rem">
          {t("main-title")}
        </Typography>
        <Stack mt="2rem" gap="0.5rem">
          {points.map((text) => {
            return (
              <Stack flexDirection="row" key={text} gap="0.5rem">
                <RadioButtonCheckedOutlinedIcon color="success" />
                <Typography fontWeight="bold">{t(text)}</Typography>
              </Stack>
            );
          })}
        </Stack>
        <Stack
          sx={{
            alignItems: "center",
            img: {
              width: "90%",
              margin: "0 5%",
              maxWidth: 400,
            },
          }}
        >
          <div>
            <img src={wattioLogo} />
          </div>
        </Stack>
      </Stack>
    </Paper>
  );
};

export default Header;
