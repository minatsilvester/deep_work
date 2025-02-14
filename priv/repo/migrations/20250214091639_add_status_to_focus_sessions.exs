defmodule DeepWork.Repo.Migrations.AddStatusToFocusSessions do
  use Ecto.Migration

  def change do
    alter table(:focus_sessions) do
      add :status, :string
    end
  end
end
