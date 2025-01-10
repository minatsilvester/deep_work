defmodule DeepWorkWeb.UserSessionJSON do

  def show(user) do
    %{
      id: user.id,
      token: user.token,
      email: user.email
    }
  end
end
