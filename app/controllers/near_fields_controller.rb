class NearFieldsController < ApplicationController
  def index
    @fields = FieldAddress.near([current_user.latitude, current_user.longitude], 5)
  end
end
