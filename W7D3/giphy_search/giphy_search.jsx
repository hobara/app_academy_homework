import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import * as APIUtil from './util/api_util';



document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  window.store.fetchSearchGiphys = APIUtil.fetchSearchGiphys;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
