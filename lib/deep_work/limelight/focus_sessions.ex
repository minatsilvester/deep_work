defmodule DeepWork.Limelight.FocusSessions do
  use Ecto.Schema
  import Ecto.Changeset

  @required_atttribute [
                        :expected_length,
                        :session_date,
                        :start_time,
                        :user_id,
                        :expected_end_time
                       ]

  @optional_attributes [
                        :actual_length,
                        :end_time,
                       ]

  schema "focus_sessions" do
    field :actual_length, :string
    field :end_time, :naive_datetime
    field :expected_end_time, :naive_datetime
    field :expected_length, :integer
    field :session_date, :date
    field :start_time, :naive_datetime
    belongs_to :user, DeepWork.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(focus_sessions, attrs) do
    focus_sessions
    |> cast(attrs, @required_atttribute ++ @optional_attributes)
    |> validate_required(@required_atttribute)
  end
end
