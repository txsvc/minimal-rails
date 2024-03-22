# README

A minimalistic RAILS starter app, ready for deployment on Google App Engine.

* No database support, use REST APIs instead
* No login or user management, supports OAuth on Google, GitHub and Discord

## Setup

### OAuth Providers

#### on Google Cloud

* Create an `OAuth Consent Screen`
* Create an `OAuth 2.0 Client ID`

#### on GitHub

* Create a new `OAuth App`

#### on Discord

TBD

**Note:** The Client IDs and Client Secrets are needed for the next step!


### Google App Engine

Make a copy of `app.yaml.example` and rename it to `app.yaml`. Review and edit the file.

To deploy the app:

```shell
make deploy
```


## Resources

### Local development

#### Rebuild the web assets

```shell
make build_web
```

#### Environment


```shell
export PROJECT_ID=
export GITHUB_KEY=
export GITHUB_SECRET=
export GOOGLE_APPLICATION_CREDENTIALS=
export GOOGLE_CLIENT_ID=
export GOOGLE_CLIENT_SECRET=
```

#### Run locally

```shell
bundle exec rails s
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

#### Initial creation

```shell
rails new . --minimal --skip-active-record
```

## References

* [Ruby runtimes on Google App Engine](https://cloud.google.com/appengine/docs/standard/ruby/runtime)
* [sclorg/rails-ex](https://github.com/sclorg/rails-ex) deployment on Red Hat OpenShift
