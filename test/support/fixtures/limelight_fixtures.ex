defmodule DeepWork.LimelightFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DeepWork.Limelight` context.
  """

  @doc """
  Generate a focus_sessions.
  """
  def focus_sessions_fixture(attrs \\ %{}) do
    {:ok, focus_sessions} =
      attrs
      |> Enum.into(%{
        actual_length: "some actual_length",
        end_time: ~N[2025-01-03 08:58:00],
        expected_length: 42,
        session_date: ~D[2025-01-03],
        start_time: ~N[2025-01-03 08:58:00]
      })
      |> DeepWork.Limelight.create_focus_sessions()

    focus_sessions
  end
end
