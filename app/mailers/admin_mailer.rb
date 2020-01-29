class AdminMailer < ActionMailer::Base
  default from: "ne-pas-repondre@florileges.info"

  def export_process_complete(recipient, attachment)
    if recipient.present? #!! Add Role checker
      attachments[attachment.filename] = attachment
      mail(to: recipient.email, subject: "Export des données disponible")
    else
      puts "Le destinataire de cet email n'est pas un administrateur"
    end
  end
end
