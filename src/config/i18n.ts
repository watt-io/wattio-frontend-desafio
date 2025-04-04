import i18next from "i18next";
import LanguageDetector from "i18next-browser-languagedetector";
import { initReactI18next } from "react-i18next";
import localeEN from "@/constants/locales/en.json";
import localePTBR from "@/constants/locales/pt-BR.json";

const resources = {
  en: {
    translation: localeEN,
  },
  pt: {
    translation: localePTBR,
  },
};

i18next // config
  .use(LanguageDetector)
  .use(initReactI18next)
  .init({
    fallbackLng: "pt-br",
    lowerCaseLng: true,
    interpolation: {
      escapeValue: false,
    },
    resources,
  });
