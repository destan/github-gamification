class HooksController < ApplicationController
  protect_from_forgery :except => [:track]

  def index
  end

  def track
    ap params

  end
end
