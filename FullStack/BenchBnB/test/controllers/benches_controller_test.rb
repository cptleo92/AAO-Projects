require 'test_helper'

class BenchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bench = benches(:one)
  end

  test "should get index" do
    get benches_url
    assert_response :success
  end

  test "should get new" do
    get new_bench_url
    assert_response :success
  end

  test "should create bench" do
    assert_difference('Bench.count') do
      post benches_url, params: { bench: { description: @bench.description, lat: @bench.lat, lng: @bench.lng } }
    end

    assert_redirected_to bench_url(Bench.last)
  end

  test "should show bench" do
    get bench_url(@bench)
    assert_response :success
  end

  test "should get edit" do
    get edit_bench_url(@bench)
    assert_response :success
  end

  test "should update bench" do
    patch bench_url(@bench), params: { bench: { description: @bench.description, lat: @bench.lat, lng: @bench.lng } }
    assert_redirected_to bench_url(@bench)
  end

  test "should destroy bench" do
    assert_difference('Bench.count', -1) do
      delete bench_url(@bench)
    end

    assert_redirected_to benches_url
  end
end
