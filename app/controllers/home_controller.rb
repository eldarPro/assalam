class HomeController < ApplicationController
  allow_unauthenticated_access
  def index
    @title = "Газета «Ас-салам»"
  end

  def search

  end

  def category
    @title = "Категория ..."
  end
end