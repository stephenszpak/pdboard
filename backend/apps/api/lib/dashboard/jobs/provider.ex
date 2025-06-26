defmodule Dashboard.Jobs.Provider do
  @callback fetch(String.t()) :: [%{title: String.t(), company: String.t(), url: String.t()}]
end
