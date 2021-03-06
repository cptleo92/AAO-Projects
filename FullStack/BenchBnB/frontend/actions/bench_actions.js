export const RECEIVE_BENCHES = "RECEIVE_BENCHES"
export const RECEIVE_BENCH = "RECEIVE_BENCH"
import * as BenchAPIUtil from "../util/bench_api_util"

const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
})

const receiveBench = bench => ({
  type: RECEIVE_BENCH,
  bench
})

export const fetchBenches = (filters) => dispatch => {
  return BenchAPIUtil.fetchBenches(filters)
    .then(benches => dispatch(receiveBenches(benches)))
}

export const createBench = bench => dispatch => {
  return BenchAPIUtil.createBench(bench)
    .then(bench => dispatch(receiveBench(bench)))
}