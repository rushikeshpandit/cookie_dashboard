defmodule CookieDashboardWeb.Sidebar do
  use Phoenix.Component
  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

  def sidebar(assigns) do
    ~H"""
    <aside class="border-r bg-zinc-200 px-5 py-8 space-y-6">
      <strong class="flex gap-2 text-xl items-center font-semibold text-zinc-900">
        <span>
          l
        </span>
        <span>
          Cookies
        </span>
      </strong>
      <div class="flex w-full items-center gap-2 rounded-lg border border-zinc-300 px-3 py-2 shadow-sm">
      <.icon name="hero-magnifying-glass-solid" class="h-5 w-5" />
      <input type="search" placeholder="search" class=" flex-1 bg-transparent p-0 text-zinc-900 border-0 placeholder-zinc-600"/>
      </div>
    </aside>
    """
  end
end
