defmodule DeepWorkWeb.UsersJSON do

  def show(%{user: user}) do
    %{
      data: %{
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        time_zone: user.time_zone,
        message: "Registration Successfull, Please log in"
      }
    }
  end
end
