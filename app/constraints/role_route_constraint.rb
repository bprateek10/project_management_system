class RoleRouteConstraint
  def initialize(&block)
    @block = block || lambda { |user| true }
  end

  def matches?(request)
    user = current_user(request)
    user.present? && @block.call(user)
  end

  def current_user(request)
    User.find_by_id(request.session["warden.user.user.key"].try(:first).try(:first))
  end
end