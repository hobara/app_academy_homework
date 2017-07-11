import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root.jsx';
import configureStore from './store/store.js';
import allTodos from './reducers/selectors.js'

document.addEventListener("DOMContentLoaded", () => {
  window.store = configureStore;
  window.selectors = allTodos;
  const root = document.getElementById('root');

  ReactDOM.render(<Root store={store}/>, root);
});
