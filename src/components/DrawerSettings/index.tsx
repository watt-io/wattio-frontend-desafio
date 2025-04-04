import { useRef, useState } from "react";
import Button from "@mui/material/Button";
import Chip from "@mui/material/Chip";
import Divider from "@mui/material/Divider";
import Drawer from "@mui/material/Drawer";
import IconButton from "@mui/material/IconButton";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";

import SettingsSharpIcon from "@mui/icons-material/SettingsSharp";
import NightsStayIcon from "@mui/icons-material/NightsStay";
import WbSunnyIcon from "@mui/icons-material/WbSunny";

import CloseIcon from "@mui/icons-material/Close";
import { getTheme, useSetThemeMode } from "@/store/reducers/theme/theme.hooks";
import { useTranslation } from "react-i18next";
import i18next from "i18next";

const buttonThemeStyle = {
  backgroundColor: "custom.boxHover",
  "&:hover": {
    backgroundColor: "custom.boxHover",
    opacity: "0.8",
  },
};

const DrawerSettings = () => {
  const { t } = useTranslation();
  const [showInstallApp, setShowInstallApp] = useState(true);
  const [open, setOpen] = useState(false);
  const themeConfig = getTheme();
  const setThemeMode = useSetThemeMode();

  const handlerInstallApp = async () => {
    if (window._deferredPrompt) {
      window._deferredPrompt.prompt();
      const userChoice = await window._deferredPrompt.userChoice;
      if (userChoice.outcome === "accepted") setShowInstallApp(false);
    }
  };

  return (
    <>
      <Drawer anchor="right" open={open} onClose={() => setOpen(false)}>
        <Stack
          sx={{
            width: 280,
          }}
        >
          <Stack
            flexDirection="row"
            justifyContent="space-between"
            alignItems="center"
            p="0.5rem"
          >
            <Typography fontWeight="500">{t("settings")}</Typography>
            <IconButton onClick={() => setOpen(false)}>
              <CloseIcon />
            </IconButton>
          </Stack>
          <Divider variant="fullWidth" orientation="horizontal" flexItem />
        </Stack>
        <Stack mt="10px" gap="10px">
          <Stack
            flexDirection="row"
            alignItems="center"
            p="0 0.5rem"
            justifyContent="space-between"
          >
            <Chip label={t("theme")} variant="filled" />
            <Stack flexDirection="row" gap="0.5rem">
              <IconButton
                onClick={() => setThemeMode("light")}
                sx={themeConfig.mode === "light" ? buttonThemeStyle : null}
              >
                <WbSunnyIcon />
              </IconButton>
              <IconButton
                onClick={() => setThemeMode("dark")}
                sx={themeConfig.mode === "dark" ? buttonThemeStyle : null}
              >
                <NightsStayIcon />
              </IconButton>
            </Stack>
          </Stack>
          <Stack
            flexDirection="row"
            alignItems="center"
            p="0 0.5rem"
            justifyContent="space-between"
          >
            <Chip label={t("language")} variant="filled" />
            <Stack flexDirection="row">
              <Select
                value={i18next.language}
                onChange={({ target: { value } }) => {
                  i18next.changeLanguage(value);
                }}
                variant="standard"
                size="small"
              >
                <MenuItem value="en-us">{t("en")}</MenuItem>
                <MenuItem value="pt-br">{t("pt-br")}</MenuItem>
              </Select>
            </Stack>
          </Stack>
          {showInstallApp && window._deferredPrompt && (
            <Stack
              flexDirection="row"
              alignItems="center"
              p="0 0.5rem"
              justifyContent="space-between"
            >
              <Chip label={t("app-pwa")} variant="filled" />
              <Button variant="outlined" onClick={handlerInstallApp}>
                {t("request")}
              </Button>
            </Stack>
          )}
        </Stack>
      </Drawer>
      <Button
        variant="contained"
        sx={{
          position: "fixed",
          bottom: 10,
          right: 30,
          maxWidth: 50,
          maxHeight: 50,
          minWidth: 50,
          minHeight: 50,
          borderRadius: 100,
        }}
        color="secondary"
        onClick={() => setOpen((open) => !open)}
      >
        <SettingsSharpIcon />
      </Button>
    </>
  );
};

export default DrawerSettings;
