import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import ThunkMiddleware from '../middleware/thunk';

const configureStore = (preloadedState = {}) => (
  createStore(rootReducer, preloadedState, applyMiddleware(ThunkMiddleware))
);

export default configureStore;
