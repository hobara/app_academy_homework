import React from 'react';
import ReactDOM from 'react-dom';
import uniqueId from '../../util/unique_id'

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: '', body: '', done: false, id: uniqueId() };
    this.submitForm = this.submitForm.bind(this);
    this.setTodo = this.setTodo.bind(this);
  }

  submitForm(event) {
    event.preventDefault();
    this.props.createTodo(this.state).then(() => (this.setState({ title: "", body: "", done: false, id: uniqueId() }))).then(() => (this.props.clearErrors()));
  }

  setTodo(key) {
    return (event => this.setState({[key]: event.currentTarget.value }));
  }

  render() {
    return (
      <form onSubmit={this.submitForm}>
        <label>
          Title:
          <input onChange={this.setTodo('title')} type="text" value={this.state.title}/>
        </label>
        <label>
          Body:
          <textarea onChange={this.setTodo('body')} value={this.state.body}></textarea>
        </label>
        <input type="submit" value="Create Todo!" />
      </form>
    );
  }
}

export default TodoForm;
