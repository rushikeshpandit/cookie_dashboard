defmodule CookieDashboard.Repo do
  use Ecto.Repo,
    otp_app: :cookie_dashboard,
    adapter: Ecto.Adapters.Postgres
end
