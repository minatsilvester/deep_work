defmodule DeepWork.Repo.Migrations.ModifyActualLengthTypeToInteger do
  use Ecto.Migration

  def up do
    execute("""
    ALTER TABLE focus_sessions
    ALTER COLUMN actual_length TYPE integer
    USING actual_length::integer
    """)
  end
end
