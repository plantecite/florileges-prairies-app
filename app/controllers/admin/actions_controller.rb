class Admin::ActionsController < Admin::BaseController
  def index
    @current_user = current_user
  end

  # POST /admin/actions/admin_export
  def admin_export
    ExporterWorker.perform_async(current_user.id)
    respond_to do |format|
      format.html { redirect_to admin_actions_url, notice: "Dès qu'elles seront prêtes, toutes les données vous seront envoyées à l'adresse <#{current_user.email}>" }
      format.json { head :no_content }
    end
  end
end
