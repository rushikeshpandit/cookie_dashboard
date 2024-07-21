defmodule CookieDashboardWeb.Sidebar do
  use Phoenix.Component
  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

  def sidebar(assigns) do
    ~H"""
    <aside class="border-r bg-zinc-200 px-5 py-8 space-y-6">
      <strong class=" mx-1 flex gap-2 text-xl items-center font-semibold text-zinc-900">
        <span>
          l
        </span>
        <span>
          Cookies
        </span>
      </strong>
      <.search_bar />
      <.main_navigation />
    </aside>
    """
  end

  defp search_bar(assigns) do
    ~H"""
      <div class="mx-1 flex w-full items-center gap-2 rounded-lg border border-zinc-300 px-3 py-2 shadow-sm">
        <.icon name="hero-magnifying-glass-solid" class="h-5 w-5" />
        <input type="search" placeholder="search" class=" flex-1 bg-transparent p-0 text-zinc-900 border-0 placeholder-zinc-600"/>
      </div>
    """
  end

  defp main_navigation(assigns) do
    ~H"""
    <nav class="space-y-0.5">
      <.nav_items icon="hero-home-solid" title="Home"/>
      <.nav_items icon="hero-chart-bar-solid" title="Dashboard"/>
      <.nav_items icon="hero-square-2-stack-solid" title="Projects"/>
      <.nav_items icon="hero-check-badge-solid" title="Tasks"/>
      <.nav_items icon="hero-chart-pie-solid" title="Reporting"/>
      <.nav_items icon="hero-user-solid" title="Users"/>
    </nav>
    """
  end


  attr :icon, :string, required: true
  attr :title, :string, required: true

  def nav_items(assigns) do
    ~H"""
      <a href="#" class="flex items-center gap-3 rounded px-3 py-2 transition-all hover:bg-pink-500 ">
        <.icon name={@icon} class="h-5 w-5 text-zinc-500 group-hover:text-pink-500" />
        <span class="font-medium text-zinc-700 group-hover:text-pink-500"> <%= @title %> </span>
        <.icon name="hero-chevron-down-solid" class="ml-auto h-5 w-5 group-hover:text-pink-500" />
      </a>
    """
  end
end
