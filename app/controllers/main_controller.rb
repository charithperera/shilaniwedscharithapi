class MainController < ApplicationController
  def get_invitation
    binding.pry
    render json: {
      'result': 'success'
    }
  end
end
