class AdminMailer < ActionMailer::Base
  default from: "ne-pas-repondre@florileges.info"

  def export_process_complete(recipient, attachment)
    if recipient.present? #!! Add Role checker
      attachments[attachment.name] = File.read(attachment.path)
      mail(to: recipient.email, subject: "Export des données disponible")
    else
      puts "Le destinataire est absent!..."
    end
  end
end
