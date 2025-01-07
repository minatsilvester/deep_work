# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DeepWork.Repo.insert!(%DeepWork.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DeepWork.Accounts

user1 = %{
  first_name: "Minat",
  last_name: "Silvester",
  email: "minatsilvester@gmail.com",
  time_zone: "Asia/Kolkata",
  password: "Silver@270599"
}

Accounts.register_user(user1)
