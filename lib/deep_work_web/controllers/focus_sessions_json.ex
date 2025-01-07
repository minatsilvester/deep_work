defmodule DeepWorkWeb.FocusSessionsJSON do
  alias DeepWork.Limelight.FocusSessions

  @doc """
  Renders a list of focus_sessions.
  """
  def index(%{focus_sessions: focus_sessions}) do
    %{data: for(focus_sessions <- focus_sessions, do: data(focus_sessions))}
  end

  @doc """
  Renders a single focus_sessions.
  """
  def show(%{focus_sessions: focus_sessions}) do
    %{data: data(focus_sessions)}
  end

  defp data(%FocusSessions{} = focus_sessions) do
    %{
      id: focus_sessions.id,
      session_date: focus_sessions.session_date,
      start_time: focus_sessions.start_time,
      end_time: focus_sessions.end_time,
      expected_length: focus_sessions.expected_length,
      actual_length: focus_sessions.actual_length
    }
  end
end
