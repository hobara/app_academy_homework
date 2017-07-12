import * as TodoAPIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
export const CLEAR_ERRORS = "CLEAR_ERRORS";


export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const clearErrors = () => ({
  type: CLEAR_ERRORS
});

export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then((todos) => {
    return dispatch(receiveTodos(todos));
  })
)

export const createTodo = todo => dispatch => {
    return TodoAPIUtil.createTodo(todo)
      .then(todo => dispatch(receiveTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON)));
};

export const updateTodo = todo => dispatch => {
    return TodoAPIUtil.updateTodo(todo)
      .then(todo => dispatch(receiveTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON)));
};
export const deleteTodo = todo => dispatch => {
    return TodoAPIUtil.deleteTodo(todo)
      .then(todo => dispatch(removeTodo(todo)));
};
