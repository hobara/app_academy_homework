import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch);


  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});


// #2
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   let result = next(action);
//   console.log(store.getState());
//   return result;
// };
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };

// #1
// const addLoggingToDispatch = (store) => {
//   const dispatched = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     dispatched(action);
//     console.log(store.getState());
//   };
// };
