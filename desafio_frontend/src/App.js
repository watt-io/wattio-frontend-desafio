import { Route, Routes } from "react-router-dom";
import About from "./pages/About/About";

import Home from "./pages/Home/Home";

import "./App.css";
import "./pages/Home/Home.css";
import "./pages/About/About.css";

function App() {
  return (
    <Routes>
      <Route path="" element={<Home />} />
      <Route path="/about/:name" element={<About />} />
    </Routes>
  );
}

export default App;
