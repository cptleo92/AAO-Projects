import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  const isLoggedIn = () => (
    <div>
      <h3>Welcome, {currentUser.username}!</h3>
      <button onClick={logout}>Log out</button>
    </div>
  )

  const isLoggedOut = () => (
    <div>
      <Link to="./signup">
        Sign Up
      </Link>
      <Link to="./login">
        Log in
      </Link>
    </div>
  )

  return currentUser ? isLoggedIn() : isLoggedOut()
}

export default Greeting;