# -*- encoding : utf-8 -*-
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
    mail(:to => email, :subject => "En plakat du har ansvaret for har blitt endret av bestiller.")
  end

  def poster_taken(poster)
    email = poster.orderer.email
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "Noen i Layout har påtatt seg å lage din plakat.")
  end

  def poster_ready(poster)
    email = poster.orderer.email
    @poster = poster
    @url = poster_url @poster
    mail(:to => email, :subject => "En av dine plakater er klar til henting")
  end
end
