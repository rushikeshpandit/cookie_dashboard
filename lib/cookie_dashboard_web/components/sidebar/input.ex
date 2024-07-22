defmodule CookieDashboardWeb.Sidebar.Input do
  use Phoenix.Component

  slot :prefix
  attr :rest, :global

  attr :class, :string,
    default: "flex-1 bg-transparent p-0 text-zinc-900 border-0 placeholder-zinc-600"

  attr :type, :string, default: "search"
  attr :placeholder, :string, default: "Search"

  def input(assigns) do
    ~H"""
    <div class="mx-1 flex w-full items-center gap-2 rounded-lg border border-zinc-300 px-3 py-2 shadow-sm">
      <%= render_slot(@prefix) %>
      <input type={@type} placeholder={@placeholder} class={@class} {@rest} />
    </div>
    """
  end
end
