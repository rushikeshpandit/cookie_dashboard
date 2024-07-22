defmodule CookieDashboardWeb.Sidebar do
  use Phoenix.Component
  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

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
      <.search_bar />
      <.main_navigation />
      <div class="mt-auto gap-6 flex flex-col">
        <nav class="space-y-0.5">
          <.nav_items icon="hero-user-circle-solid" title="Support" />
          <.nav_items icon="hero-cog-solid" title="Settings" />
        </nav>
        <.company_goals_widget />
        <div class="h-px bg-zinc-00" />
        <.profile />
      </div>
    </aside>
    """
  end

  defp profile(assigns) do
    ~H"""
    <div class="grid items-center gap-3 grid-cols-navprofile">
      <img
        src="https://github.com/rushikeshpandit.png"
        alt="User profile photo"
        class="h-10 w-10 rounded-full"
      />
      <div class="flex flex-col truncate">
        <span class="text-sm font-semibold text-zinc-700">Rushikesh Pandit</span>
        <span
          class="text-sm text-zinc-500"
          title="emailemailemailemailemailemailemailemailemailemailemail@email.com"
        >
          emailemailemailemailemailemailemailemailemailemailemail@email.com
        </span>
      </div>
      <button>
        <.icon name="hero-chevron-right-solid" class="ml-auto h-5 w-5 text-zinc-500 transition-all" />
      </button>
    </div>
    """
  end

  defp company_goals_widget(assigns) do
    ~H"""
    <div class="flex flex-col gap-4 rounded-lg bg-sky-50 px-4 py-5">
      <div class="space-y-1">
        <span class="text-sm/5 font-medium text-sky-700">Goals Achived </span>
        <p class="text-sm/5 text-sky-500">Your team has achieved 80% of the goal</p>
      </div>
      <div class="h-2 rounded-full bg-sky-100 ">
        <div class="h-2 w-4/5 rounded-full bg-sky-600"></div>
      </div>
      <div class="space-x-3">
        <button class="text-sm font-medium text-sky-500 hover:text-sky-600">Dismiss</button>
        <button class="text-sm font-medium text-sky-700 hover:text-sky-900">
          Set a new goal
        </button>
      </div>
    </div>
    """
  end

  defp search_bar(assigns) do
    ~H"""
    <div class="mx-1 flex w-full items-center gap-2 rounded-lg border border-zinc-300 px-3 py-2 shadow-sm">
      <.icon name="hero-magnifying-glass-solid" class="h-5 w-5" />
      <input
        type="search"
        placeholder="search"
        class=" flex-1 bg-transparent p-0 text-zinc-900 border-0 placeholder-zinc-600"
      />
    </div>
    """
  end

  defp main_navigation(assigns) do
    ~H"""
    <nav class="space-y-0.5">
      <.nav_items icon="hero-home-solid" title="Home" />
      <.nav_items icon="hero-chart-bar-solid" title="Dashboard" />
      <.nav_items icon="hero-square-2-stack-solid" title="Projects" />
      <.nav_items icon="hero-check-badge-solid" title="Tasks" />
      <.nav_items icon="hero-chart-pie-solid" title="Reporting" />
      <.nav_items icon="hero-user-solid" title="Users" />
    </nav>
    """
  end

  attr :icon, :string, required: true
  attr :title, :string, required: true

  def nav_items(assigns) do
    ~H"""
    <a
      href="#"
      class="flex items-center gap-3 rounded px-3 py-2 transition-all group hover:bg-sky-500 "
    >
      <.icon name={@icon} class="h-5 w-5 text-zinc-500 group-hover:text-sky-700" />
      <span class="font-medium text-zinc-700 group-hover:text-sky-700"><%= @title %></span>
      <.icon name="hero-chevron-down-solid" class="ml-auto h-5 w-5 group-hover:text-sky-700" />
    </a>
    """
  end
end
