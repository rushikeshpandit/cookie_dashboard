defmodule CookieDashboardWeb.Sidebar.Profile do
  use Phoenix.Component
  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

  def profile(assigns) do
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
      <button class="group ml-auto p-8 hover:bg-zinc-100 rounded-md bg-zinc-50">
        <.icon
          name="hero-chevron-right-solid"
          class="ml-auto h-5 w-5 text-zinc-500 group-hover:text-sky-500 transition-all"
        />
      </button>
    </div>
    """
  end
end
