.PHONY: run build best_webm best_mp4 webm mp4

run:
ifndef URL
	docker build -t youtube-dl .
	docker run --rm youtube-dl --help

else
ifdef FORMAT
ifdef OUTPUT
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f "$$FORMAT" --merge-output-format="$$OUTPUT"

else
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f "$$FORMAT" 

endif
else
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -F

endif
endif

build:
	docker build --no-cache -t youtube-dl .

best_webm:
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f bestvideo+bestaudio --merge-output-format=webm

best_mp4:
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f bestvideo+bestaudio --merge-output-format=mp4

webm:
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f "$$FORMAT" --merge-output-format=webm

mp4:
	docker run --rm -ti -v "$$PWD/output:/data" youtube-dl "$$URL" -f "$$FORMAT" --merge-output-format=mp4

