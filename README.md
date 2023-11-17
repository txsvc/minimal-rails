# README

'mini-app' is a minimal rails app that is so `mini`, it does not even use a database !

It includes application gems like:

* [High Voltage](https://github.com/thoughtbot/high_voltage) for static pages
* [appengine-ruby](https://github.com/GoogleCloudPlatform/appengine-ruby) optional integration library for the Ruby runtime for Google App Engine

And development gems like:

* [RuboCop](https://github.com/rubocop/rubocop) for static code analysis and formatting

Possible future add-ons:

* [prometheus_exporter](https://github.com/thoughtbot/prometheus_exporter) for collecting and aggregating prometheus metrics


## Build and deploy

See [config/deployment](config/deployment) for details.


## References

* [Ruby runtimes on Google App Engine](https://cloud.google.com/appengine/docs/standard/ruby/runtime)
* [sclorg/rails-ex](https://github.com/sclorg/rails-ex) deployment on Red Hat OpenShift


## Other

### Setup

#### Initial creation

```shell
rails new . --minimal --skip-active-record
```

#### Checks before committing

```shell
bundler exec rubocop -a
```

#### Credentials etc ...

Create `credentials.yml.enc`

```shell
bundler rails credentials:edit
```

Edit `credentials.yml.enc`

```shell
EDITOR="nano" rails credentials:edit
```
