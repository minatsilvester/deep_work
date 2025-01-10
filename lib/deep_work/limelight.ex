defmodule DeepWork.Limelight do
  @moduledoc """
  The Limelight context.
  """

  import Ecto.Query, warn: false
  import DeepWork.Utils.Common

  alias DeepWork.Repo
  alias DeepWork.Limelight.FocusSessions

  @doc """
  Returns the list of focus_sessions.

  ## Examples

      iex> list_focus_sessions()
      [%FocusSessions{}, ...]

  """
  def list_focus_sessions(user) do
    from(fs in FocusSessions, where: fs.user_id == ^user.id) |> Repo.all()
  end

  @doc """
  Gets a single focus_sessions.

  Raises `Ecto.NoResultsError` if the Focus sessions does not exist.

  ## Examples

      iex> get_focus_sessions!(123)
      %FocusSessions{}

      iex> get_focus_sessions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_focus_sessions!(id), do: Repo.get!(FocusSessions, id)

  @doc """
  Creates a focus_sessions.

  ## Examples

      iex> create_focus_sessions(%{field: value})
      {:ok, %FocusSessions{}}

      iex> create_focus_sessions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_focus_sessions(attrs \\ %{}, user) do
    %FocusSessions{}
    |> FocusSessions.changeset(
      modify_attrs_for_session(attrs, user)
    )
    |> Repo.insert()
  end

  defp modify_attrs_for_session(attrs, user) do
    attrs
    |> put_user_id_in_attributes(user.id)
    |> add_start_and_end_time(user)
  end

  defp add_start_and_end_time(attrs, user) do
    {from, to} = get_from_and_to_dateteimes(attrs, user)
    attrs
    |> Map.put("start_time", from)
    |> Map.put("expected_end_time", to)
    |> Map.put("session_date", NaiveDateTime.to_date(from))
  end

  defp get_from_and_to_dateteimes(attrs, user) do
    from = DateTime.now!(user.time_zone) |> DateTime.to_naive()
    {from, NaiveDateTime.add(from, attrs["expected_length"])}
  end

  @doc """
  Updates a focus_sessions.

  ## Examples

      iex> update_focus_sessions(focus_sessions, %{field: new_value})
      {:ok, %FocusSessions{}}

      iex> update_focus_sessions(focus_sessions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_focus_sessions(%FocusSessions{} = focus_sessions, attrs) do
    focus_sessions
    |> FocusSessions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a focus_sessions.

  ## Examples

      iex> delete_focus_sessions(focus_sessions)
      {:ok, %FocusSessions{}}

      iex> delete_focus_sessions(focus_sessions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_focus_sessions(%FocusSessions{} = focus_sessions) do
    Repo.delete(focus_sessions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking focus_sessions changes.

  ## Examples

      iex> change_focus_sessions(focus_sessions)
      %Ecto.Changeset{data: %FocusSessions{}}

  """
  def change_focus_sessions(%FocusSessions{} = focus_sessions, attrs \\ %{}) do
    FocusSessions.changeset(focus_sessions, attrs)
  end
end
