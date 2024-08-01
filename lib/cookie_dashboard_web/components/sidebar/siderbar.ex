defmodule CookieDashboardWeb.Sidebar do
  use Phoenix.Component
  import CookieDashboardWeb.CoreComponents, only: [icon: 1]
  alias __MODULE__.Widgets
  alias __MODULE__.Profile
  alias __MODULE__.Input

  def sidebar(assigns) do
    ~H"""
    <aside class="border-r bg-zinc-200 px-5 py-8 flex flex-col gap-6">
      <strong class=" mx-1 flex gap-2 text-xl items-center font-semibold text-zinc-900">
        <span>
          l
        </span>
        <span>
          Cookies
        </span>
      </strong>
      <%= if @current_user do %>
        <.search_bar />
        <.main_navigation />
        <div class="mt-auto gap-6 flex flex-col">
          <nav class="space-y-0.5">
            <.nav_items icon="hero-user-circle-solid" title="Support" />
            <.nav_items
              icon="hero-cog-solid"
              title="Settings"
              link="/users/settings"
              is_expandable={false}
            />
          </nav>
          <Widgets.company_goals_widget />
          <div class="h-px bg-zinc-00" />
          <Profile.profile current_user={@current_user} />
        </div>
      <% else %>
        <div class="flex space-x-2">
          <.link
            href="/users/register"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Register |
          </.link>

          <.link
            href="/users/log_in"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Log in
          </.link>
        </div>
      <% end %>
    </aside>
    """
  end

  defp search_bar(assigns) do
    ~H"""
    <div>
      <Input.input type="search" placeholder="Search">
        <:prefix>
          <.icon name="hero-magnifying-glass-solid" class="h-5 w-5" />
        </:prefix>
      </Input.input>
    </div>
    """
  end

  defp main_navigation(assigns) do
    ~H"""
    <nav class="space-y-0.5">
      <.nav_items icon="hero-home-solid" title="Home" />
      <.nav_items icon="hero-chart-bar-solid" title="Dashboard" link="/dashboards" />
      <.nav_items icon="hero-square-2-stack-solid" title="Projects" />
      <.nav_items icon="hero-check-badge-solid" title="Tasks" />
      <.nav_items icon="hero-chart-pie-solid" title="Reporting" />
      <.nav_items icon="hero-user-solid" title="Users" />
    </nav>
    """
  end

  attr :icon, :string, required: true
  attr :title, :string, required: true
  attr :link, :string, default: "#"
  attr :is_expandable, :boolean, default: true

  def nav_items(assigns) do
    ~H"""
    <a
      href={@link}
      class="flex items-center gap-3 rounded px-3 py-2 transition-all group hover:bg-sky-500 "
    >
      <.icon name={@icon} class="h-5 w-5 text-zinc-500 group-hover:text-sky-700" />
      <span class="font-medium text-zinc-700 group-hover:text-sky-700"><%= @title %></span>
      <.icon :if={@is_expandable} name="hero-chevron-down-solid" class="ml-auto h-5 w-5 group-hover:text-sky-700" />
    </a>
    """
  end
end
