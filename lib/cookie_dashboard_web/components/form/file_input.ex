defmodule CookieDashboardWeb.Form.FileInput do
  use Phoenix.Component

  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

  slot :label
  slot :preview

  def upload_image(assigns) do
    ~H"""
    <div class="flex items-start gap-5">
      <%= render_slot(@preview) || image_preview(assigns) %>
      <%= render_slot(@label) || default_label(assigns) %>
      <.control />
    </div>
    """
  end

  defp control(assigns) do
    ~H"""
    <input type="file" class="sr-only" id="photo" />
    """
  end

  defp default_label(assigns) do
    ~H"""
    <label
      for="photo"
      class="flex-1 cursor-pointer flex-col flex items-center gap-3 rounded-lg border border-zinc-300 hover:bg-sky-50 px-6 py-4 text-center hover:border-sky-300 text-zinc-500 hover:text-sky-500 shadow-sm transition-all group"
    >
      <div class="border-6 border-zinc-50 bg-zinc-100 rounded-full p-2 group-hover:bg-sky-200 group-hover:border-sky-100">
        <.icon name="hero-cloud-arrow-up-solid" class="h-5 w-5" />
      </div>
      <div class="flex flex-col items-center gap-1">
        <span class="text-sm">
          <span class="font-semibold text-sky-700 group-hover:brightness-110">Click to upload</span>
          or Drag and Drop
        </span>
        <span class="text-xs">SVG, PNG or GIF (max 2 MB)</span>
      </div>
    </label>
    """
  end

  defp image_preview(assigns) do
    ~H"""
    <div class="bg-sky-50 h-16 w-16 flex items-center justify-center rounded-full">
      <.icon name="hero-user-solid" class="h-8 w-8 text-sky-500" />
    </div>
    """
  end
end
