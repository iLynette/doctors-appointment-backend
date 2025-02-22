class Users::RegistrationsController < Devise::RegistrationsController
  private

  def respond_with(_resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: {
      message: 'something went wrong'
    }, status: :unprocessable_entity
  end
end
