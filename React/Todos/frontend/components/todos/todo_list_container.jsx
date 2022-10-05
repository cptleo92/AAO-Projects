import { connect } from "react-redux";
import { allTodos, allErrors } from "../../reducers/selectors";
import TodoList from "./todo_list";
import { updateTodo, removeTodo, fetchTodos, createTodo } from "../../actions/todo_actions";
import { clearErrors } from "../../actions/error_actions";

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: allErrors(state)
})

const mapDispatchToProps = dispatch => ({
  updateTodo: todo => dispatch(updateTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  clearErrors: () => dispatch(clearErrors())
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
