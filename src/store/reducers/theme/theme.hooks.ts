import { AppDispatch, RootStore } from "@/store";
import { useDispatch, useSelector } from "react-redux";
import { changeThemeMode, ThemeState } from "./theme.reducer";

export const getTheme = () =>
  useSelector<RootStore, ThemeState>((state) => state.theme);

export const useSetThemeMode = () => {
  const dispatch = useDispatch<AppDispatch>();
  return (mode: ThemeState["mode"]) => dispatch(changeThemeMode(mode));
};
