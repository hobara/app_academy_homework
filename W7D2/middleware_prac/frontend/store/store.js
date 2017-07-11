import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    RootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  let result = next(action);
  console.log(store.getState());
  return result;
};


export default configureStore;
