import { setItem } from "@/utils/storage/localStorage";
import { PayloadAction } from "@reduxjs/toolkit";
import { ThemeState } from "./theme.reducer";

export const changeThemeMode = (
  state: ThemeState,
  { payload }: PayloadAction<ThemeState["mode"]>
) => {
  setItem("theme", payload);
  state.mode = payload;
  return state;
};
