defmodule Dates do
  @moduledoc """
  Example for date manipulation with vanilla Elixir / Erlang
  """

  @doc """
  All dates between the two (Elixir) Dates
  """
  @spec days_between(Calendar.date, Calendar.date) :: [Calendar.date]
  def days_between(date1, date2) do
    days_between(date1, date2, fn(_) -> true end)
  end

  @doc """
  All dates between the two (Elixir) Dates, ignoring Saturdays and Sundays
  """
  @spec weekdays_between(Calendar.date, Calendar.date) :: [Calendar.date]
  def weekdays_between(date1, date2) do
    days_between(date1, date2, &gregorian_weekday?/1)
  end

  defp days_between(date1, date2, filter) do
    for g <- (elixir_to_gregorian_days(date1)..elixir_to_gregorian_days(date2)), filter.(g), do:  gregorian_days_to_elixir_date(g)
  end

  defp elixir_to_gregorian_days(elixir_date) do
    elixir_date
    |> Date.to_erl
    |> :calendar.date_to_gregorian_days
  end

  defp gregorian_days_to_elixir_date(gregorian_day) do
    gregorian_day
    |> :calendar.gregorian_days_to_date
    |> Date.from_erl!
  end

  defp gregorian_weekday?(gregorian_day) do
    gregorian_day
    |> :calendar.gregorian_days_to_date
    |> :calendar.day_of_the_week
    |> case do
      6 -> false
      7 -> false
      _ -> true
    end
  end
end
