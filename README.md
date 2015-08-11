# Camus

Camus is a rubygem with two purposes:

1) Validate and asynchronously broadcast audit events to Apache Kafka's 'audits' topic

2) Query a RESTful API connected to an audits database to fetch audits for a user or other auditable entity.

This gem is designed to be implanted in a Rails application that contains _auditable entities_ (users, subjects, and other data).

![sketch](http://i.imgur.com/39Ibrrh.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'camus', github: "mzemel/camus"
```

And then run:

    $ bundle install


## Example use

```ruby
Camus.audit({
  audit_guid: user.audit_guid,
  event: "User logged in via OAuth",
  ip: ip
})
```

Kafka will then produce your audit:

```bash
{"audit_guid":"02bb40d8-5136-4337-a5fc-06046e8d5df1","event":"User logged in via OAuth","ip":"127.0.0.1"}
```

You can, obviously, add whatever user information you want in the Camus#audit call and it will appear in Kafka.  The audit GUID is stored in the Rails application and will be used by Camus to query the audit database to pull audits related to the user/other auditable entity.

## Development

After checking out the repo, you can test Kafka production/consumption with running `bin/produce` and `bin/consume` in two windows, providing KAFKA_HOST and KAFKA_PORT env variables as necessary.

Run tests with `bundle exec rspec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mzemel/camus.

