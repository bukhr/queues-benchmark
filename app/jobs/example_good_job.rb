class ExampleGoodJob < ApplicationJob
  queue_as :benchmarks
  self.queue_adapter = :good_job

  def perform
  end
end
