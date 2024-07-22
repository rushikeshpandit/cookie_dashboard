defmodule CookieDashboardWeb.Sidebar.Widgets do
  use Phoenix.Component

  def company_goals_widget(assigns) do
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
end
