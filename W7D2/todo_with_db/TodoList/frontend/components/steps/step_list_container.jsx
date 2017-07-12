import { connect } from 'react-redux';
import StepList from './step_list.jsx';
import { receiveSteps } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';

const mapStateToProps = state => ({
  todo_id: state.todo(steps, ),
  steps: state.steps.stepsByTodoId()
});

const mapDispatchToProps = dispatch => ({
  createTodo: todo => dispatch(createTodo(todo)),
  deleteTodo: todo => dispatch(deleteTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  clearErrors: () => dispatch(clearErrors()),
  updateTodo: todo => dispatch(updateTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
