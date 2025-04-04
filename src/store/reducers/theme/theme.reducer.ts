import { getAsOBJ } from "@/utils/storage/localStorage";
import { createSlice } from "@reduxjs/toolkit";
import * as reducers from "./theme.actions";

export interface ThemeState {
  mode: "light" | "dark";
}

const initialState: () => ThemeState = () => {
  return { mode: getAsOBJ("theme", "dark") };
};

const slice = createSlice<ThemeState, typeof reducers, "theme">({
  initialState,
  name: "theme",
  reducers,
});

export const { changeThemeMode } = slice.actions;

export default slice.reducer;
