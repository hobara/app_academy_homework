import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';
import { merge } from 'lodash';

const stepsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_STEPS:
      const newState = {};
      action.steps.forEach(todo => {
        newState[step.id] = step;
      });
      return newState;
    case RECEIVE_STEP:
      const newTodo = { [action.step.id]: action.step };
      return merge({}, state, newTodo);
    case REMOVE_STEP:
      const prevState = merge({}, state);
      delete prevState[action.step.id];
      return prevState;
    default:
      return state;
  }
};


export default stepsReducer;
