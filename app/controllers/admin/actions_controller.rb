class Admin::ActionsController < Admin::BaseController
  def index
    @current_user = current_user
  end

  # POST /admin/actions/admin_export
  def admin_export
    export = AdminDataExporterService.new(current_user.id)
    export.call
    AdminMailer.export_process_complete(export.user, export.attachment).deliver_now
    respond_to do |format|
      format.html { redirect_to admin_actions_url, notice: "#{export.message}. Dès qu'elles seront prêtes, toutes les données vous seront envoyées à l'adresse <#{current_user.email}>" }
      format.json { head :no_content }
    end
  end
end
