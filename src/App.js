import React from 'react';
import logo from './logo.svg';
import './App.css';
import { version, testEnv } from './config';

function App() {
  return (
    <div className="App">
      <h2>
        {version}
      </h2>
      <h2>
        {testEnv}
      </h2>
    </div>
  );
}

export default App;
