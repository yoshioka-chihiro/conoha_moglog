class Public::FoodsController < ApplicationController
  before_action :search_article, only: [:index, :search]
  def index

  end


end
