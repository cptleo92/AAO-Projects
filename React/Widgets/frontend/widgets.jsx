import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tab from './tab';
import Weather from './weather';
import Autocomplete from './autocomplete'

const tabs = [
  { title: 'one', content: 'this is tab one'},
  { title: 'two', content: 'this is tab two'},
  { title: 'three', content: 'this is tab three'},
]

const names = ['Alan', 'Baby', 'Cream', 'Dio', 'Einstein', 'Fishman', 'Garage', 'Halibut', 'Leo', 'Pancake', 'Query', 'Steve', 'Teve', 'Very', 'Zenni Optical']

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render( 
    <div>
      <Clock />
      <Weather />
      <section class="small-widgets">
        <Tab tabs={tabs} />      
        <Autocomplete names={names} />
      </section>
    </div>
    , root);
})