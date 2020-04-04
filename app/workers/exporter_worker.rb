class ExporterWorker
  include Sidekiq::Worker
  sidekiq_options queue: :exporter, retry: false, backtrace: true

  def perform(user_id)
    @export = AdminDataExporterService.new(user_id)
    @export.call
    AdminMailer.export_process_complete(@export.user, @export.attachment).deliver_now
  end
end
