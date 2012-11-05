# -*- encoding : utf-8 -*-
class PosterMailer < ActionMailer::Base
  default from: "from@example.com"

  def poster_changed(poster)
    if poster.responsible == nil
      email = 'mlysgaard@gmail.com' # change to the default mail
    else
      email = poster.responsible.mail
    end
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "En plakat du har ansvaret for har blitt endret av bestiller.")
  end

  def poster_taken(poster)
    email = poster.orderer.mail
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "Noen i Layout har påtatt seg å lage din plakat.")
  end
end
