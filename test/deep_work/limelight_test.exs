defmodule DeepWork.LimelightTest do
  use DeepWork.DataCase

  alias DeepWork.Limelight

  describe "focus_sessions" do
    alias DeepWork.Limelight.FocusSessions

    import DeepWork.LimelightFixtures

    @invalid_attrs %{session_date: nil, start_time: nil, end_time: nil, expected_length: nil, actual_length: nil}

    test "list_focus_sessions/0 returns all focus_sessions" do
      focus_sessions = focus_sessions_fixture()
      assert Limelight.list_focus_sessions() == [focus_sessions]
    end

    test "get_focus_sessions!/1 returns the focus_sessions with given id" do
      focus_sessions = focus_sessions_fixture()
      assert Limelight.get_focus_sessions!(focus_sessions.id) == focus_sessions
    end

    test "create_focus_sessions/1 with valid data creates a focus_sessions" do
      valid_attrs = %{session_date: ~D[2025-01-03], start_time: ~N[2025-01-03 08:58:00], end_time: ~N[2025-01-03 08:58:00], expected_length: 42, actual_length: "some actual_length"}

      assert {:ok, %FocusSessions{} = focus_sessions} = Limelight.create_focus_sessions(valid_attrs)
      assert focus_sessions.session_date == ~D[2025-01-03]
      assert focus_sessions.start_time == ~N[2025-01-03 08:58:00]
      assert focus_sessions.end_time == ~N[2025-01-03 08:58:00]
      assert focus_sessions.expected_length == 42
      assert focus_sessions.actual_length == "some actual_length"
    end

    test "create_focus_sessions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Limelight.create_focus_sessions(@invalid_attrs)
    end

    test "update_focus_sessions/2 with valid data updates the focus_sessions" do
      focus_sessions = focus_sessions_fixture()
      update_attrs = %{session_date: ~D[2025-01-04], start_time: ~N[2025-01-04 08:58:00], end_time: ~N[2025-01-04 08:58:00], expected_length: 43, actual_length: "some updated actual_length"}

      assert {:ok, %FocusSessions{} = focus_sessions} = Limelight.update_focus_sessions(focus_sessions, update_attrs)
      assert focus_sessions.session_date == ~D[2025-01-04]
      assert focus_sessions.start_time == ~N[2025-01-04 08:58:00]
      assert focus_sessions.end_time == ~N[2025-01-04 08:58:00]
      assert focus_sessions.expected_length == 43
      assert focus_sessions.actual_length == "some updated actual_length"
    end

    test "update_focus_sessions/2 with invalid data returns error changeset" do
      focus_sessions = focus_sessions_fixture()
      assert {:error, %Ecto.Changeset{}} = Limelight.update_focus_sessions(focus_sessions, @invalid_attrs)
      assert focus_sessions == Limelight.get_focus_sessions!(focus_sessions.id)
    end

    test "delete_focus_sessions/1 deletes the focus_sessions" do
      focus_sessions = focus_sessions_fixture()
      assert {:ok, %FocusSessions{}} = Limelight.delete_focus_sessions(focus_sessions)
      assert_raise Ecto.NoResultsError, fn -> Limelight.get_focus_sessions!(focus_sessions.id) end
    end

    test "change_focus_sessions/1 returns a focus_sessions changeset" do
      focus_sessions = focus_sessions_fixture()
      assert %Ecto.Changeset{} = Limelight.change_focus_sessions(focus_sessions)
    end
  end
end
