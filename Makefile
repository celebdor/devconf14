CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

reveal-js-presentation.zip: 
	grunt zip

output:	reveal-js-presentation.zip
	unzip reveal-js-presentation.zip -d output

publish: output/index.html
	git branch -D gh-pages
	git checkout -b gh-pages
	find . | grep -v 'output/' | xargs git rm
	git mv output/* .
	git push -f
	git checkout $CURRENT_BRANCH

clean:
	rm -fr output
