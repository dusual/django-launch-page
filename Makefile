build:
	python setup.py sdist

clean:
	rm -rf ./dist
	rm -rf *.egg-info
	rm -rf ./.tox
	find . -name *.pyc -delete

install_deps: install_deps_py

install_deps_py:
	PIP_DOWNLOAD_CACHE=/tmp pip install -r requirements.txt

register:
	python setup.py register

test: test_django test_tox

test_django:
	python example_project/manage.py test --settings=example_project.settings.test

test_tox:
	tox --recreate

upload:
	python setup.py upload
