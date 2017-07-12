export const allTodos = state => {
  return Object.keys(state.todos).map(id => state.todos[id]);
};

export const stepsByTodoId = (state, todoId) => {
  return Object.keys(state.steps).map(todoId => state.steps[todoId]);
};
