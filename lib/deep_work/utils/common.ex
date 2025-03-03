defmodule DeepWork.Utils.Common do
  @moduledoc """
  The module will host all functions that
  will be commonly be used by other modules
  """

  def put_user_id_in_attributes(attrs, user_id) do
    Map.put(attrs, "user_id", user_id)
  end

  def get_current_naive_datetime(user) do
    DateTime.now!(user.time_zone) |> DateTime.to_naive()
  end

  def get_todays_date(user) do
    DateTime.now!(user.time_zone) |> DateTime.to_date()
  end

  def get_difference_in_naive_date_time(end_time, start_time) do
    NaiveDateTime.diff(end_time, start_time)
  end
end
