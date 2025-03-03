defmodule DeepWorkWeb.FocusSessionsController do
  use DeepWorkWeb, :controller

  alias DeepWork.Limelight
  alias DeepWork.Limelight.FocusSessions

  action_fallback DeepWorkWeb.FallbackController

  def index(conn, _params) do
    focus_sessions = Limelight.list_focus_sessions(conn.assigns.current_user, conn.query_params)
    render(conn, :index, focus_sessions: focus_sessions)
  end

  def create(conn, %{"focus_sessions" => focus_sessions_params}) do
    with {:ok, %FocusSessions{} = focus_sessions} <- Limelight.create_focus_sessions(focus_sessions_params, conn.assigns.current_user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/focus_sessions/#{focus_sessions}")
      |> render(:show, focus_sessions: focus_sessions)
    end
  end

  def show(conn, %{"id" => id}) do
    focus_sessions = Limelight.get_focus_sessions!(id)
    render(conn, :show, focus_sessions: focus_sessions)
  end

  def update(conn, %{"id" => id, "focus_sessions" => focus_sessions_params}) do
    focus_sessions = Limelight.get_focus_sessions!(id)

    with {:ok, %FocusSessions{} = focus_sessions} <- Limelight.update_focus_sessions(focus_sessions, focus_sessions_params) do
      render(conn, :show, focus_sessions: focus_sessions)
    end
  end

  def stop(conn, %{"id" => id, "focus_sessions" => focus_sessions_params}) do
    focus_sessions = Limelight.get_focus_sessions!(id)

    with {:ok, %FocusSessions{} = focus_sessions} <- Limelight.stop_focus_sessions(focus_sessions, focus_sessions_params, conn.assigns.current_user) do
      render(conn, :show, focus_sessions: focus_sessions)
    end
  end

  def delete(conn, %{"id" => id}) do
    focus_sessions = Limelight.get_focus_sessions!(id)

    with {:ok, %FocusSessions{}} <- Limelight.delete_focus_sessions(focus_sessions) do
      send_resp(conn, :no_content, "")
    end
  end
end
