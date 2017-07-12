import React from 'react';
import merge from 'lodash/merge';
import TodoDetailView from './todo_detail_view'

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleTodo = this.toggleTodo.bind(this);
    this.toggleDisplay = this.toggleDisplay.bind(this);
  }

  handleDelete(todo) {
    return (event => this.props.deleteTodo(this.props.todo));
  }

  toggleTodo() {
    const todo = merge({}, this.props.todo);
    todo.done = !this.props.todo.done;
    this.props.updateTodo(todo);
  }

  toggleDisplay() {
    this.setState({ detail: !this.state.detail });
  }

  render () {
    const { todo } = this.props;
    let detailView = "";
    if (this.state.detail) {
      detailView = <TodoDetailView todo={ todo } />
    }
    return (
      <li>
        <span onClick={this.toggleDisplay}>{ this.props.todo.title }</span>
        <button onClick={this.toggleTodo}>{(todo.done ? "Undo" : "Done")}</button>
        <br />
        { detailView }
      </li>
    )
  }
}

export default TodoListItem;
