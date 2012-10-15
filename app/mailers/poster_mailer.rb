class PosterMailer < ActionMailer::Base
  default from: "from@example.com"

  def poster_changed(poster)
    if poster.responsible == nil
      email = 'mlysgaard@gmail.com'
    else
      email = poster.responsible.email
    end
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "poster changed")
  end
end
