require 'benchmark'

# Slower, a lot slower
def recursive_fib(n)
  return 0 if n == 0
  return 1 if n == 1
  recursive_fib(n - 1) + recursive_fib(n - 2)
end

# Faster, a lot faster
def iterative_fib(n)
  return 0 if n == 0
  pre = 0
  nex = 1
  store = 0
  (n - 1).times do
    store = nex
    nex = pre + nex
    pre = store
  end

  nex
end

## Benchmark tests
bench_num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(bench_num) }
  x.report("iterative_fib") { iterative_fib(bench_num) }
end
