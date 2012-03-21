class InfoRequestConfirmation < ActionMailer::Base
  default from: "Alcor Admin <admin@alcorsoftware.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_request_confirmation.requested.subject
  #
  def requested(information_request)
    @information_request = information_request
   
    puts @information_request.email_address
    #@information_request.email_address
    mail to: "#{@information_request.email_address}", bcc: "adam.wolf@alcorsoftware.com", subject: "CCC Information Request"
  end
end
