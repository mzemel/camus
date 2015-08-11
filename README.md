# Camus

Camus is a rubygem with two purposes:

1) Asynchronously broadcast validated audit events to Apache Kafka's 'audits' topic

2) Query a RESTful API connected to an audits database to fetch audits for a user or other auditable entity.

This gem is designed to be implanted in a Rails application that contains auditable entities (users, subjects, and other data).

![sketch](http://i.imgur.com/39Ibrrh.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'camus', path: /path/to/camus
```

And then execute:

    $ bundle


## Example use

```ruby
Camus.audit({
  audit_guid: user.audit_guid,
  event: "User logged in via Dexcom",
  ip: ip
})
```

Kafka will then produce your audit:

```bash
{"audit_guid":"02bb40d8-5136-4337-a5fc-06046e8d5df1","event":"User logged in via Dexcom","ip":"127.0.0.1"}
```


## Development

After checking out the repo, you can test Kafka production/consumption with the files `bin/produce` and `bin/consume`, providing KAFKA_HOST and KAFKA_PORT as necessary.

Tests are run with `bundle exec rspec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mzemel/camus.

