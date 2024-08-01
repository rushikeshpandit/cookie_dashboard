defmodule CookieDashboardWeb.DashboardLive.MyDetails do
  use CookieDashboardWeb, :live_component
  alias CookieDashboard.Accounts
  alias CookieDashboard.Accounts.User

  def update(%{current_user: current_user} = assigns, socket) do
    user_changeset = Accounts.change_user_registration(current_user, assigns)
    socket = socket |> assign(assigns) |> assign(user_form: to_form(user_changeset))
    {:ok, socket}
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user_form")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
