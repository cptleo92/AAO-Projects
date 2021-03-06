import { connect } from "react-redux";
import SessionForm from "./session_form"
import { signup } from "../actions/session_actions";

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors.session,
  formType: 'Sign up!'
})

const mapDispatchToProps = dispatch => ({
  processForm: user => dispatch(signup(user))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm)