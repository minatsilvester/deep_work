defmodule DeepWork.Repo.Migrations.AddNameToFocusSessions do
  use Ecto.Migration

  def change do
    alter table(:focus_sessions) do
      add :name, :string
    end
  end
end
