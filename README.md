# Poshy Matcher

The basic idea behind this gem is to be able to detect if a non nested hash matches a query string.
The query syntax is extremely simple but has some limitations.

Example

```ruby
query = '(name=john&age>20)|(name!=john&age<40)'
input = { name: 'john', age: 30 }

PoshyMatcher.match?(query, input) # true
```

Poshy Matcher is just a minimal interface to a Treetop based Parser. Check the grammar for more details.

## Limitations

This is just a proof of concept of something needed for a personal project, so I just spent a few hours
working on this.

Right now is not possible to compare floating point numbers, and alphanumerical variables/values are not yet supported.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
