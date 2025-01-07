defmodule DeepWork.Utils.Common do
  @moduledoc """
  The module will host all functions that
  will be commonly be used by other modules
  """

  def put_user_id_in_attributes(attrs, user_id) do
    Map.put(attrs, "user_id", user_id)
  end
end
