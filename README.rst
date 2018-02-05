Ansible Role Sentry
###################

|Build Status| |Ansible Galaxy| |GitHub issues| |Average time to resolve an issue| |Percentage of issues still open| |GitHub license|

:Version: 0.0.0
:Web: https://github.com/hadenlabs/ansible-role-sentry
:Download: http://github.com/hadenlabs/ansible-role-sentry
:Source: http://github.com/hadenlabs/ansible-role-sentry
:Keywords: ansible-role-sentry

.. contents:: Table of Contents:
    :local:

Ansible Galaxy role for `Sentry`_.

Requirements:
=============

List of applications:

- `Python 3.6.1`_
- `Docker`_
- `Docker Compose`_

Install
=======

Install it with the following command:

.. code-block:: bash

    $ ansible-galaxy install hadenlabs.sentry

Role Variables
==============

The default role variables in ``defaults/main.yml`` are:

.. code-block:: yaml

    sentry_organization: ''
    sentry_token: ''
    sentry_release_version: ''
    sentry_environment: ''
    sentry_deploy_name: ''

- Deploy code

.. code-block:: yaml

    - role: hadenlabs.sentry

Dependencies
============

None

License
=======

MIT

Changelog
=========

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
============

Please see `CONTRIBUTING`_ for details.

Credits
=======

-  `author`_
-  `contributors`_

Made with :heart: :coffee: and :pizza: by `author`_ and `company`_.

.. Badges:

.. |Build Status| image:: https://travis-ci.org/hadenlabs/ansible-role-sentry.svg
   :target: https://travis-ci.org/hadenlabs/ansible-role-sentry
.. |Ansible Galaxy| image:: https://img.shields.io/badge/galaxy-hadenlabs.python-blue.svg
   :target: https://galaxy.ansible.com/hadenlabs/ansible-role-sentry/
.. |GitHub issues| image:: https://img.shields.io/github/issues/hadenlabs/ansible-role-sentry.svg
   :target: https://github.com/hadenlabs/ansible-role-sentry/issues
.. |Average time to resolve an issue| image:: http://isitmaintained.com/badge/resolution/hadenlabs/ansible-role-sentry.svg
   :target: http://isitmaintained.com/project/hadenlabs/ansible-role-sentry
.. |Percentage of issues still open| image:: http://isitmaintained.com/badge/open/hadenlabs/ansible-role-sentry.svg
   :target: http://isitmaintained.com/project/hadenlabs/ansible-role-sentry
.. |GitHub license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE

.. Links
.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst

.. _`company`: https://github.com/hadenlabs
.. _`author`: https://github.com/luismayta

.. dependences
.. _Sentry: https://sentry.io/welcome/
.. _Python 3.6.1: https://www.python.org/downloads/release/python-361
.. _Docker: https://www.docker.com/
.. _Docker Compose: https://docs.docker.com/compose/