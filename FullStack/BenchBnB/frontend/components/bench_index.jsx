import React from 'react';
import BenchIndexItem from './bench_index_item'

class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
  } 

  render() {
    return (
      <div className="bench-index">
        {
          this.props.benches.map(bench => <BenchIndexItem key={bench.id} bench={bench} />)
        }
      </div>
    )
  }
}

export default BenchIndex;