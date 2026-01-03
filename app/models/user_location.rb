class UserLocation < ApplicationRecord
  #belongs_to
  belongs_to :user
  belongs_to :location
  belongs_to :tenant

  # validations
  validate :same_tenant

  private 

  def same_tenant
    return if user.nil? || location.nil? || tenant_id.nil?

    if user.tenant_id != tenant_id || location.tenant_id != tenant_id
      errors.add(:base, "User and Location must belong to the same tenant")
    end
  end
end
