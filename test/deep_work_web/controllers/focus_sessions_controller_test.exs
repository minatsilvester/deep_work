defmodule DeepWorkWeb.FocusSessionsControllerTest do
  use DeepWorkWeb.ConnCase

  import DeepWork.LimelightFixtures

  alias DeepWork.Limelight.FocusSessions

  @create_attrs %{
    session_date: ~D[2025-01-03],
    start_time: ~N[2025-01-03 08:58:00],
    end_time: ~N[2025-01-03 08:58:00],
    expected_length: 42,
    actual_length: "some actual_length"
  }
  @update_attrs %{
    session_date: ~D[2025-01-04],
    start_time: ~N[2025-01-04 08:58:00],
    end_time: ~N[2025-01-04 08:58:00],
    expected_length: 43,
    actual_length: "some updated actual_length"
  }
  @invalid_attrs %{session_date: nil, start_time: nil, end_time: nil, expected_length: nil, actual_length: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all focus_sessions", %{conn: conn} do
      conn = get(conn, ~p"/api/focus_sessions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create focus_sessions" do
    test "renders focus_sessions when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/focus_sessions", focus_sessions: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/focus_sessions/#{id}")

      assert %{
               "id" => ^id,
               "actual_length" => "some actual_length",
               "end_time" => "2025-01-03T08:58:00",
               "expected_length" => 42,
               "session_date" => "2025-01-03",
               "start_time" => "2025-01-03T08:58:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/focus_sessions", focus_sessions: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update focus_sessions" do
    setup [:create_focus_sessions]

    test "renders focus_sessions when data is valid", %{conn: conn, focus_sessions: %FocusSessions{id: id} = focus_sessions} do
      conn = put(conn, ~p"/api/focus_sessions/#{focus_sessions}", focus_sessions: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/focus_sessions/#{id}")

      assert %{
               "id" => ^id,
               "actual_length" => "some updated actual_length",
               "end_time" => "2025-01-04T08:58:00",
               "expected_length" => 43,
               "session_date" => "2025-01-04",
               "start_time" => "2025-01-04T08:58:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, focus_sessions: focus_sessions} do
      conn = put(conn, ~p"/api/focus_sessions/#{focus_sessions}", focus_sessions: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete focus_sessions" do
    setup [:create_focus_sessions]

    test "deletes chosen focus_sessions", %{conn: conn, focus_sessions: focus_sessions} do
      conn = delete(conn, ~p"/api/focus_sessions/#{focus_sessions}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/focus_sessions/#{focus_sessions}")
      end
    end
  end

  defp create_focus_sessions(_) do
    focus_sessions = focus_sessions_fixture()
    %{focus_sessions: focus_sessions}
  end
end
