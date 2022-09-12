class ExampleQueJob < Que::Job
  self.priority = 1
  self.queue = :benchmarks
  def run
  end
end
