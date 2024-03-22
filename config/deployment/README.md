# Deployment

## Red Hat OpenShift

### Preparation

* Make a copy of `build_webhook_secrets.example.yaml` with name `build_webhook_secrets.yaml`. 
* Make a copy of `secrets.example.yaml` with name `secrets.yaml`. 

*WARNING:* make sure that above files DO NOT get comitted !

#### Parameters

Required build ENV settings:

* RAILS_MASTER_KEY: prevents that a new `master.key` is created during the app build

Optional build ENV settings:

* BUNDLE_REBUILD: ignore a `Gemfile.lock` file if present.
* BUNDLE_WITHOUT: exclude e.g. `development` or `test` gems

Required run ENV settings:

* RAILS_MASTER_KEY: without a master.key, RAILS will fail to load it's secrets ...

Optional run ENV settings:

* RAILS_SERVE_STATIC_FILES
* RAILS_MIN_THREADS: Default == 5
* RAILS_MAX_THREADS: Default == max_threads_count
* PORT: Only set/change if you are REALLY sure you know what you are doing. (default == 8080)


### Create a namespace

```shell
oc new-project <your_project_name>
```

### Deployment

```shell

# secrets
oc apply -f build_webhook_secrets.yaml
oc apply -f secrets.yaml

# build
oc apply -f build_config_map.yaml
oc apply -f build_config.yaml

# deploy
oc apply -f deployment_config_map.yaml
oc apply -f deployment_config.yaml

```
