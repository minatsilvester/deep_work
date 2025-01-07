defmodule DeepWork.Repo do
  use Ecto.Repo,
    otp_app: :deep_work,
    adapter: Ecto.Adapters.Postgres
end
