defmodule DeepWork.Repo.Migrations.CreateFocusSessions do
  use Ecto.Migration

  def change do
    create table(:focus_sessions) do
      add :session_date, :date
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :expected_length, :integer
      add :actual_length, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:focus_sessions, [:user_id])
  end
end
