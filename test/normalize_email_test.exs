defmodule NormalizeEmailTest do
  use ExUnit.Case
  doctest NormalizeEmail

  test "normalizes gmail emails" do
    gmailEmails = [
      "johnotander@gmail.com",
      "johnotander@googlemail.com",
      "johnotander@GMAIL.com",
      "johnotander+foobar@gmail.com",
      "john.o.t.a.n.d.er+foobar@gmail.com",
      "JOHN.o.t.a.n.d.er+foobar@googlemail.com",
      "john.otander@gmail.com"
    ]

    for email <- gmailEmails, do: assert(NormalizeEmail.normalize_email(email) == "johnotander@gmail.com")
  end

  test "normalizes live emails" do
    liveEmails = [
      "johnotander@live.com",
      "johnotander@live.com",
      "johnotander@live.com",
      "johnotander+foobar@live.com",
      "john.o.t.a.n.d.er+foobar@live.com",
      "JOHN.o.t.a.n.d.er+foobar@live.com",
      "john.otander@live.com"
    ]

    for email <- liveEmails, do: assert(NormalizeEmail.normalize_email(email) == "johnotander@live.com")
  end

  test "returns the string if it isn't an email" do
    assert(NormalizeEmail.normalize_email("foobar"), "foobar")
  end
end
