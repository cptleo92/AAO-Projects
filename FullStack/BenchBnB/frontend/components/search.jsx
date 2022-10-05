import React from 'react';
import BenchMap from "./bench_map"
import BenchIndex from "./bench_index"
import FilterForm from './filter_form';

export default ({ benches, fetchBenches, updateFilter }) => {
  return (
    <div>
      <BenchMap fetchBenches={fetchBenches} benches={benches} updateFilter={updateFilter}/>
      <FilterForm updateFilter={updateFilter} />
      <BenchIndex fetchBenches={fetchBenches} benches={benches}/>
    </div>
  )
}