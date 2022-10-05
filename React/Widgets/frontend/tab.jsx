import React from 'react';

class Header extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { tabs, clicker } = this.props;
    return (
      <ul>
        { 
          tabs.map((tab, idx) => <h1 className="tab-name" key={idx} onClick={ () => clicker(idx)}>{tab.title}</h1>) 
        }
      </ul>
    )
  }
}

class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      current: 0
    }

    this.tabs = this.props.tabs;
    this.switchTab = this.switchTab.bind(this);
  }

  switchTab(num) {
    this.setState({
      current: num
    })
  }

  render() {
    const { tabs } = this.props;
    const { current } = this.state;
    return (
      <div className="tab">      
        <h1>TABS</h1>
        <Header tabs={tabs} clicker={this.switchTab}/>     
          <article>
            {tabs[current].content}
          </article>
      </div>
    )
  }
}

export default Tabs;