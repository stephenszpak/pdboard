defmodule DashboardWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: DashboardWeb
      import Plug.Conn
      import DashboardWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/dashboard_web/templates",
        namespace: DashboardWeb

      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      import Phoenix.HTML
      import Phoenix.View
      alias DashboardWeb.Router.Helpers, as: Routes
    end
  end

  def gettext do
    quote do
      import DashboardWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
