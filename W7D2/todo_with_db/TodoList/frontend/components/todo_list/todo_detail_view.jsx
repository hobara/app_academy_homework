import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { todo } = this.props;
    return (
      <div>
        <ul>
          <li>{ todo.body }</li>
        </ul>
      </div>
    )
  }
}

export default TodoDetailView;
