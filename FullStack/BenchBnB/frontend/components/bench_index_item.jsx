import React from 'react';

export default ({ bench }) => {
  return (
    <ul>
      <h3>Bench #{bench.id}</h3>
      <li>Description: {bench.description}</li>
      <li>Seats: {bench.seating}</li>
      <li>Location: {bench.lat},{bench.lng}</li>
    </ul>
  )
}