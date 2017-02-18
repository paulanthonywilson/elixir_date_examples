defmodule DatesTest do
  use ExUnit.Case
  import Dates

  describe "days between" do
    test "single" do
      assert [~D{2017-02-20}] == days_between(~D{2017-02-20}, ~D{2017-02-20})
    end

    test "ascending" do
      assert [~D{2017-02-19}, ~D{2017-02-20}, ~D{2017-02-21}] == days_between(~D{2017-02-19}, ~D{2017-02-21})
    end

    test "descending" do
      assert [~D{2017-02-21}, ~D{2017-02-20}, ~D{2017-02-19}] == days_between(~D{2017-02-21}, ~D{2017-02-19})
    end
  end

  describe "weekdays between" do
    test "ignores weekends" do
      assert [~D{2017-02-17}, ~D{2017-02-20}] == weekdays_between(~D{2017-02-17}, ~D{2017-02-20})
      assert [] == weekdays_between(~D{2017-02-18}, ~D{2017-02-19})
    end
  end

end
