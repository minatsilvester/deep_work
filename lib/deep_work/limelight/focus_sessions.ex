defmodule DeepWork.Limelight.FocusSessions do
  use Ecto.Schema
  import Ecto.Changeset

  @required_atttribute [
                        :session_date,
                        :start_time,
                        :end_time,
                        :expected_length,
                        :user_id
                       ]

  @optional_attributes [
                        :actual_length
                       ]

  schema "focus_sessions" do
    field :session_date, :date
    field :start_time, :naive_datetime
    field :end_time, :naive_datetime
    field :expected_length, :integer
    field :actual_length, :string
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
