class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
    # I researched the '!!' and what I saw said that it is kinda frowned upon
  end

end
