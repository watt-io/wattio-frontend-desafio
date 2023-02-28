import React from "react";
import ReactDOM from "react-dom/client";
import RoutesApp from "./routes";
import GlobalStyles from "./styles/GlobalStyles";
import { BrowserRouter } from "react-router-dom";

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <BrowserRouter>
      <GlobalStyles />
      <RoutesApp />
    </BrowserRouter>
  </React.StrictMode>
);
