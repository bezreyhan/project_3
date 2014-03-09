class UserMailer < ActionMailer::Base
  default from: "pairedups@gmail.com"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.welcome.subject
    #

    def welcome(user_id)
        @user = User.find(user_id)
        #@url  = 'http://localhost:3000/auths/new'

        mail to: @user.email, subject: "Hey there"
    end

    # def tell_your_friends
    # mail to: "to@example.org", subject: "Tell your friend about our site"
    # end



end
