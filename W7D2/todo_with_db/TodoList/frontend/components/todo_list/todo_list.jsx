import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
import uniqueId from '../../util/unique_id';

class TodoList extends React.Component {

  componentDidMount() {
    this.props.fetchTodos();
  }

  constructor(props) {
    super(props);
  }

  render() {
    const { todos, createTodo, deleteTodo, errors, clearErrors, updateTodo } = this.props;
    const todoListItems = todos.map((todo, idx) => (
      <TodoListItem key={ idx } todo={ todo } deleteTodo={ deleteTodo } updateTodo={ updateTodo }  />
    ));
    return (
      <div>
        <ul>
          { todoListItems }
        </ul>
        <ul>
         { errors.map((error, idx) => <li key={idx}>{ error }</li>) }
        </ul>
        <TodoForm createTodo={ createTodo } clearErrors={ clearErrors } />
      </div>
    );
  }
}

export default TodoList;


// { todos.map((todo) => <li>{todo.title}</li>) }
