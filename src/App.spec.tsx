import { fireEvent, render } from "@testing-library/react";
import { describe, test, expect, vi } from "vitest";

import { Provider } from "react-redux";
import { SnackbarProvider } from "notistack";

import store from "./store";
import App from "./App";
import "./config/i18n";
import localeEN from "./constants/locales/en.json";

const readLocale = async (locale: object, cb: any) => {
  for await (const item of Object.values(locale).slice(0, 2)) {
    if (typeof item === "object") await readLocale(item, cb);
    else await cb(item);
  }
};

describe("Setup App", () => {
  test("Must check the mandatory texts.", async () => {
    const { findByText } = render(
      <Provider store={store}>
        <SnackbarProvider>
          <App />
        </SnackbarProvider>
      </Provider>
    );
    const checkTextInScreen = async (text: string) => {
      expect(await findByText(text)).toBeTruthy();
    };
    const list = [
      "main-title",
      "average-monthly-value",
      "yearly-savings",
      "per-month",
      "offers",
      "hire",
    ];
    for await (const key of list)
      await checkTextInScreen((localeEN as any)[key]);
  });

  test("Should contain an editable input.", () => {
    const { container } = render(
      <Provider store={store}>
        <SnackbarProvider>
          <App />
        </SnackbarProvider>
      </Provider>
    );

    const input = container.querySelector("input");
    expect(input).toBeTruthy();
    const status = fireEvent(input!, new InputEvent("input"));
    expect(status).toBeTruthy();
  });

  test("Should contain an range.", () => {
    const { getByTestId } = render(
      <Provider store={store}>
        <SnackbarProvider>
          <App />
        </SnackbarProvider>
      </Provider>
    );

    const range = getByTestId("range");
    expect(range).toBeTruthy();
  });

  test("Should contain an hire button.", () => {
    const { getByTestId } = render(
      <Provider store={store}>
        <SnackbarProvider>
          <App />
        </SnackbarProvider>
      </Provider>
    );

    const button = getByTestId("hire-button");
    expect(button).toBeTruthy();
  });
});
