class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'virtialworld3601@gmail.com', subject: 'inspigramに関するお問い合わせ'
  end
end
