defmodule DeepWork.Repo.Migrations.AddExpectedEndTimeToFocusSessions do
  use Ecto.Migration

  def change do
    alter table(:focus_sessions) do
      add :expected_end_time, :naive_datetime
    end
  end
end
