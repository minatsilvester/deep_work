defmodule DeepWorkWeb.UsersJSON do

  def show(%{user: user}) do
    %{
      user: %{
        first_name: user.first_name,
        last_name: user.last_name,
        message: "Registration Successfull, Please log in"
      }
    }
  end
end
