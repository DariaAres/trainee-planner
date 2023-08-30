# TRAINEE PLANNER
<p><img src="./readme_img/trainee-planner3.png" alt="Trainee planner" align="left"/>
<br>
 The current development of technology makes it possible to solve absolutely unlimited range of tasks. Every day we exchange information of all kinds, but at this time the modern world is characterized by its oversaturation. Therefore, the received information volume for the day and the plan for the near future can not always "fit" in the head. In the case when there is a lot of incoming information, there is nothing more reasonable than to keep a planner.

 Filling out the planner will be a real help for everyone in the series of events to structure them and "put" on the shelves. With such a gift you won't have to "extract information from the corners of your memory" - it's enough just to look into a notebook with daily notes.

The main purpose of the development of "Trainee planner" is to create an important tool that will allow you to conveniently systematize all your affairs and watch the weather. A web-based event management application that is fully meets modern requirements will display events in an easy-to-read manner.


# Getting started

Before we start you must be sure that you have installed:

- [RVM](http://rvm.io/rvm/install)
- [Ruby 3.2.2](https://gist.github.com/pboksz/4649025)
- [Ruby on Rais 7+ version](https://guides.rubyonrails.org/v5.1/getting_started.html)
- [MySql](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/)
- [Docker](https://docs.docker.com/engine/install/)
- [Npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stablehttps://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)

## Installation
You can clone an existing repository from GitHub.com to your local computer, or to a codespace:

```sh
   $ git clone https://github.com/DariaAres/trainee-planner.git
```

## Configure

1. Change directory to `trainee-planner`:

    ```sh
    $ cd trainee-planner
    ```

1. Installing dependencies:

    ```sh
    $ sudo apt install -yqq libpq-dev
    $ gem install bundler
    $ bundle install
    $ yarn install
    $ yarn run build
    ```

1. You can go to `.env` file to change user and connect to database, where `MYSQL_ROOT_PASSWORD` is the password that will be set for the MySQL root superuser account; `DB_USER` is a username that you created to authenticate in MySQL; `DB_PASSWORD` is the password with which your `DB_USER` can authenticate:

    ```sh
        MYSQL_ROOT_PASSWORD=password
        DB_USER=user
        DB_PASSWORD=password
    ```

1. Then you should create the databases defined in the current environment, run pending migrations and fill the current database with data defined in `db/seeds.rb`:

    ```sh
    $ rails db:create db:migrate db:seed
    ```

## Usage

- ### Start the web server locally

    This command launches a web server named Puma which comes bundled with Rails:

    ```sh
    $ rails s
    ```
    You'll use this any time you want to access your application through a web browser.

    Run with `--help` or `-h` for options.

- ### Start the web server with docker
    First of all, you need to build the project into an image file:

    ```sh
    $ docker compose build
    ```

    Now that the project is built, it's time to run it. This step of our work corresponds to the step where, when working with individual containers, the `docker run` command is executed:

    ```sh
    $ docker compose up
    ```
    Run with `--help` or `-h` for options.

## Testing

- ### Start rspec tests locally

    First of all you need to make sure that you have installed all gems:

    ```sh
    $ bundle install
    ```

    Then we can run rspec tests by the following command:

    ```sh
    $ bundle exec rspec
    ```

- ### Start rspec tests with docker

    If you have run and built app container, you can execute `bundle exec rspec` inside of the container:

    ```sh
    $ docker exec -it list bundle exec rspec
    ```

## License

This code is free to use under the terms of the MIT license.
    <br>
    <br>
    <br>
    <br>
    <p align="center"><img src="./readme_img/bunny7.png" alt="Trainee planner"></p>


