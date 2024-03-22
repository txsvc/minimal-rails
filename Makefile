PROJECT_ID=open-workspace

.PHONY: deploy
deploy: deploy_app 

.PHONY: deploy_app
deploy_app:
	bundle exec rake gcloud:deploy
	
.PHONY: build_web
build_web:
	bundle exec rails tmp:clear
	bundle exec rake assets:clobber
	bundle exec rake assets:precompile
