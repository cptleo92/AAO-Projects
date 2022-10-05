import React from 'react';
import GreetingContainer from "./greeting_container"
import { Route, Link } from 'react-router-dom';
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import SearchContainer from './search_container';
import BenchFormContainer from './bench_form_container';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <AuthRoute path="/login" component={LoginFormContainer} />
    <AuthRoute path="/signup" component={SignupFormContainer} />
    <Route exact path="/" component={SearchContainer} />
    <ProtectedRoute path="/benches/new" component={BenchFormContainer} />

    <Link to="/">Go home</Link>

  </div>
)

export default App;