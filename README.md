# normalize_email [![Build Status](https://secure.travis-ci.org/johnotander/normalize_email.png?branch=master)](https://travis-ci.org/johnotander/normalize_email)

Normalize emails for uniqueness validation. This will convert the email to lowercase, remove dots (`.`), and plus signs followed by arbitrary strings (`+foobar`).

## Installation

Add normalize_email to your list of dependencies in `mix.exs`

```elixir
def deps do
  [{:normalize_email, "~> 0.0.1"}]
end
```

Ensure normalize_email is started before your application

```elixir
def application do
  [applications: [:normalize_email]]
end
```

## Usage

```elixir
NormalizeEmail.normalize_email("johnotander+foobar@gmail.com")
# => "johnotander@gmail.com"

NormalizeEmail.normalize_email("JOHN.OT.ander+OHAI@gmail.com")
# => "johnotander@gmail.com"
```

## Development

```
mix test
```

## Related

* Elixir port from the [`normalize-email`](https://github.com/johnotander/normalize-email) node module.

## License

MIT

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Crafted with <3 by [John Otander](http://johnotander.com) ([@4lpine](https://twitter.com/4lpine)).
