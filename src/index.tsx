import { render } from 'react-dom';
import { getEnv } from "./env";

render(
  <p>{JSON.stringify(getEnv(), null, 2)}</p>,
  document.getElementById("root")
);
