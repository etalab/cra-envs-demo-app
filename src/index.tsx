import { render } from 'react-dom';
import { getEnv } from "./env";
import "./index.css";

const env = getEnv();


render(
  <>
    <h1
      style={{ "fontFamily": getEnv().THEME_ID === "france" ? "Marianne" : "'Work Sans'" }}
    >
      Hello world
    </h1>
    <pre> {JSON.stringify(env, null, 2)} </pre>
    <div id="foobar"/>
  </>,
  document.getElementById("root")
);
