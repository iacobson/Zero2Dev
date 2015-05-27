class ContactForm < MailForm::Base

  attribute :choice
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method in ActionMailer accepts.
  def headers
    {
      :subject => %("#{name} wants to #{user_choice}"),
      :to => "dorian.iacobescu@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end


  def user_choice
    case choice
    when "contribute"
      return "contribute to project development"
    when "feature"
      return "suggest new feature"
    when "bug"
      return "report a bug"
    when "feedback"
      return "give feedback"
    end
  end

end
