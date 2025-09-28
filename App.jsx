import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Hello from React + Docker 🚀</h1>
      <p>This app has only 2 files: App.jsx and Dockerfile.</p>
    </div>
  );
}

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<App />);
