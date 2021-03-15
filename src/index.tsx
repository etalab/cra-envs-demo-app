import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import { getEnv } from "./env";

alert(JSON.stringify(getEnv(),null,2));

ReactDOM.render(
    <App />,
  document.getElementById("root")
);
