class ExampleDelayedJob < ApplicationJob
  queue_as :benchmarks
  self.queue_adapter = :delayed_job
  def perform
  end
end
