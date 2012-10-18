class PosterMailer < ActionMailer::Base
  default from: "from@example.com"

  def poster_changed(poster)
    if poster.responsible == nil
      email = 'mlysgaard@gmail.com' # change to the default mail
    else
      email = poster.responsible.email
    end
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "poster changed")
  end

  def poster_taken(poster)
    email = poster.orderer.email
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "poster changed")
  end

end
