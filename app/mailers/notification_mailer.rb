class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added
  	mail(to: "fmj213@stern.nyu.edu",
  		subject: "A comment has been added to your place")
  end

end
