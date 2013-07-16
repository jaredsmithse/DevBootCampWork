helpers do

  def dice_roles
    @dice_roles ||= DieRoles.new(session)
  end

end
