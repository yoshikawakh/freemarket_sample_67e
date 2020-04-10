module AccountsHelper
  def current_user?(accout)
     accout == current_user
  end
end