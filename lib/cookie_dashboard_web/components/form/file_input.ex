defmodule CookieDashboardWeb.Form.FileInput do
  use Phoenix.Component

  import CookieDashboardWeb.CoreComponents, only: [icon: 1]

  attr :property_input, :any, required: true
  attr :target, :any, required: true
  slot :label
  slot :preview

  def upload_image(assigns) do
    ~H"""
    <section class="flex items-start gap-5" phx-drop-target={@property_input.ref}>
      <%= render_slot(@preview) || image_preview(assigns) %>
      <%= render_slot(@label) || default_label(assigns) %>
      <.control property_input={@property_input} />
    </section>
    """
  end

  defp control(assigns) do
    ~H"""
    <.live_file_input upload={@property_input} class="sr-only" />
    """
  end

  defp default_label(assigns) do
    ~H"""
    <label
      for={@property_input.ref}
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
        <span class="text-xs">
          <%= accept_format(@property_input.accept) %> Add upto <%= @property_input.max_entries %> (max <%= trunc(
            @property_input.max_file_size / 1_000_000
          ) %> MB each)
        </span>
      </div>
    </label>
    """
  end

  defp accept_format(:any), do: ""

  defp accept_format(accept) do
    accept
    |> String.replace(".", "")
    |> String.replace(",", ", ")
    |> String.upcase()
  end

  defp image_preview(assigns) do
    ~H"""
    <div class="bg-sky-50 h-16 w-16 flex items-center justify-center rounded-full">
      <.icon
        :if={Enum.empty?(@property_input.entries)}
        name="hero-user-solid"
        class="h-8 w-8 text-sky-500"
      />
      <div :if={!Enum.empty?(@property_input.entries)}>
        <.live_img_preview
          entry={hd(@property_input.entries)}
          class="h-16 w-16 rounded-full object-cover"
        />
        <button
          type="button"
          phx-target={@target}
          phx-click="cancel-upload"
          phx-value-ref={hd(@property_input.entries).ref}
          phx-value-upload_property={@property_input.name}
          aria-label="Cancel"
        >
          <.icon name="hero-x-mark-solid" class="h-3 w-3 text-zinc-500" />
        </button>
      </div>
    </div>
    """
  end

  def file_list(assigns) do
    ~H"""
    <div class="mt-5 space-y-3">
      <article :for={entry <- @property_input.entries}>
        <div class="group flex items-start gap-4 rounded-lg border border-zinc-200 p-4">
          <div class="rounded-full border-4 bg-sky-200 border-sky-100 text-sky-600">
            <.icon name="hero-cloud-arrow-up-solid" class="h-5 w-5" />
          </div>
          <div class="flex flex-1 flex-col items-start gap-1">
            <div class="fle flex-col ">
              <span class="text-sm font-medium text-sinc-700">
                <%= entry.client_name %>
              </span>
              <span class="text-sm text-sinc-600">
                <%= entry.client_size / 1_000_000 %> MB
              </span>
            </div>
            <div class="flex w-full items-center gap-3">
              <div class="h-2 flex-1 rounded-full bg-zinc-100">
                <div class="w-4/5 h-2 rounded-full bg-sky-600"></div>
              </div>
              <div class="text-sm font-medium text-zinc-700">
                <%= entry.progress %>
              </div>
            </div>
          </div>
          <button
            type="button"
            class="ml-auto rounded-md p-2 hover:bg-zinc-50"
            phx-target={@target}
            phx-click="cancel-upload"
            phx-value-ref={entry.ref}
            phx-value-upload_property={@property_input.name}
            aria-label="Cancle"
          >
            <.icon name="hero-x-mark-solid" class="h-3 w-3 text-zinc-500" />
          </button>
        </div>
      </article>
    </div>
    """
  end
end
