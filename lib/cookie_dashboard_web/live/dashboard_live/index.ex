defmodule CookieDashboardWeb.DashboardLive.Index do
  use CookieDashboardWeb, :live_view
  alias CookieDashboardWeb.DashboardLive.MyDetails

  def handle_params(params, _, socket) do
    {:noreply, assign(socket, :tab, params["tab"] || "my_details")}
  end

  attr :title, :string, required: true
  attr :link, :string, required: true
  attr :is_selected, :boolean, default: false

  def tab_item(assigns) do
    ~H"""
    <.link
      patch={@link}
      class={
        (@is_selected && "text-sky-500") || "text-zinc-500"
        "relative px-1 pb-4 text-sm font-medium hover:text-sky-700 transition-all"
      }
    >
      <span><%= @title %></span>
      <div :if={@is_selected} class="absolute -bottom-px left-0 right-0 h-0.5 bg-sky-700"></div>
    </.link>
    """
  end
end
