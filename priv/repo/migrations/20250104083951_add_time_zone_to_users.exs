defmodule DeepWork.Repo.Migrations.AddTimeZoneToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :time_zone, :string, null: false # Need this to identify the user's time zone to provide correct details of time
    end
  end
end
