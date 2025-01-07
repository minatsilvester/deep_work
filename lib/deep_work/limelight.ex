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
      put_user_id_in_attributes(attrs, user.id)
    )
    |> Repo.insert()
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
