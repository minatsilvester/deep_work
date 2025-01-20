defmodule DeepWorkWeb.UserSessionJSON do

  def show(user) do
    %{
      data: %{
        id: user.id,
        token: user.token,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        time_zone: user.time_zone
      }
    }
  end
end
