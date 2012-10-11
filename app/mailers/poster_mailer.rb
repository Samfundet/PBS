class PosterMailer < ActionMailer::Base
  default from: "from@example.com"

  def poster_changed(member, poster)
    @member = member
    @poster = poster
    @url = poster_url @poster
    mail(:to => member.email, :subject => "poster changed")
  end
end
