clean:
	php please ssg:clear

build: clean
	php please ssg:generate

deploy: build
	aws s3 sync ./storage/app/static s3://blog.leskowsky.net --delete

.PHONY: clean build deploy