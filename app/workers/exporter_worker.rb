class ExporterWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "#{name}-#{count}"
  end
end
