class Api::V1::ProfilesController < Api::V1::BaseController
  def me
    respond_with current_resource_owner
  end

  def index
    respond_with other_resource_owners
  end

  protected

  def other_resource_owners
    User.where.not(id: current_resource_owner.id) if doorkeeper_token
  end
end
