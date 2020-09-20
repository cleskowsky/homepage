clean:
	@echo "Clearing static site..."
	php please ssg:clear

build: clean
	@echo "Generating static site..."
	php please ssg:generate

deploy: build
	echo "Copy static site to s3 bucket..."
	aws s3 sync ./storage/app/static s3://blog.leskowsky.net --delete

.PHONY: clean build deploy