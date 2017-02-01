class IndexController < ApplicationController
  def home
  end

  def about
    @app = App.new "TestTest"
  end

  def apps
  end

  def photos
  end

  private;
  class App
    attr_accessor :name
    def initialize name
      @name = name
    end
  end
end
