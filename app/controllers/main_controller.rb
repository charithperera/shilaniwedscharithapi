class MainController < ApplicationController
  def get_invitation
    render json: {
      'result': 'success'
    }
  end
end
