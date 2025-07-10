# PHP workbench

<p align="center">
  <img src="./assets/logo.png" alt="Projektlogo" width="300"/>
</p>

This project provides a workbench for PHP applications.
Motivation is to not have PHP installed on your local system but to let everything run in a docker compose stack.
The PHP project you are interested in is linked into the container via symlink.

Suppose this is the folder structure on your system.

~~~bash
martin@box ~% tree -d ./Workbench -L 2
./Workbench
├── PHP-Workbench
│   └── build
└── Symfony
    ├── src
    └── vendor
6 directories
~~~

The folders **PHP-Workbench** and the project you want to put onto the workbench (i.e. Symfony) are located side-by-side.

~~~bash
cd PHP-Workbench

# create a symlink
ln -s ../Symfony ./project

# build the image
make build

# boot the stack
make up

# open a shell on the workbench container in order to work on the project code base
make shell
~~~

Note: Changes to the project must be commited inside the respective repository (i.g. in Symfony directly).