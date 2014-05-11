class AnonMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify_email(partner, infection)
    @partner = partner
    @user = @partner.user
    mail(to: @partner.email, subject: "Notification from RisqueFactr")
    @infection = infection
  end
end
