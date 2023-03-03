import { configureStore } from "@reduxjs/toolkit";
import offersReducer from "./reducers/offers/offers.reducer";
import themeReducer from "./reducers/theme/theme.reducer";

const store = configureStore({
  reducer: {
    theme: themeReducer,
    offers: offersReducer,
  },
});

export type RootStore = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

export default store;
