class PanelsController < ApplicationController
  def index
  	@users = User.all
  	@roles = Role.all
  end
end
