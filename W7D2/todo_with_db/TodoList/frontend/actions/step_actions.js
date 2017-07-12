export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receiveSteps = todos => ({
  type: RECEIVE_STEPS,
  todos
});

export const receiveStep = todo => ({
  type: RECEIVE_STEP,
  todo
});

export const removeStep = todo => ({
  type: REMOVE_STEP,
  todo
});
