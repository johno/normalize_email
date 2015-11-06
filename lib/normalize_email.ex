defmodule NormalizeEmail do
  @moduledoc """
  The base module of NormalizeEmail.

  It exposes a primary function, `normalize_email`, and a few utils.
  """

  @doc """
  Normalizes an email. This is useful for storing, comparing, etc.

  Args:

  * `email` - the email to normalize, string

  Returns a normalized email as a string.
  """
  def normalize_email(email) do
    if IsEmail.validate(email) do
      if is_plus_email_provider(email) do
        email = String.replace(email, ~r/\+(.*)@/, "@")
      end

      if is_dot_email_provider(email) do
        [username, domain] = get_email_parts(email)
        email = String.replace(username, ~r/\./, "") <> "@" <> domain
      end

      email = String.replace(email, ~r/googlemail\.com$/, "gmail.com")
      String.downcase(email)
    else
      email
    end
  end

  @doc """
  Checks whether the email domain allows `+` emails.

  Args:

  * `email` - the email to check, string

  Returns a boolean.
  """
  def is_plus_email_provider(email) do
    [_, domain] = get_email_parts(email)
    String.match?(domain, ~r/^(live\.com|gmail\.com|googlemail\.com)$/)
  end
 
  @doc """
  Checks whether the email domain allows `.` emails.

  Args:

  * `email` - the email to check, string

  Returns a boolean.
  """
  def is_dot_email_provider(email) do
    [_, domain] = get_email_parts(email)
    String.match?(domain, ~r/^(live\.com|gmail\.com|googlemail\.com)$/)
  end

  @doc """
  Split an email to a username and domain parts.

  Args:

  * `email` - the email to split, string

  Returns a two string `List` -- `[username, domain]`.
  """
  def get_email_parts(email) do
    String.split(email, "@", parts: 2)
  end
end
