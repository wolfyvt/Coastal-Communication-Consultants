class InfoRequestConfirmation < ActionMailer::Base
  default from: "Avis Griffith <info@coastalcommunicationconsultants.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_request_confirmation.requested.subject
  #
  def requested(information_request)
    @information_request = information_request
      
    mail to: "#{@information_request.email_address}", bcc: "avis@coastalcommunicationconsultants.com", subject: "CCC Information Request"
  end
end
