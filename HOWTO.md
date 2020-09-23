# HOWTO table of contents
## [How to run locally](#Running-the-project-locally)
- [Installing Ruby & Rails](#Installing-Ruby--Rails)
- [Cloning this Repository](#Cloning-This-Repository)
- [Installing & Configuring Postgres](#Installing--Configuring-Postgres)
- [Installing Dependencies](#Installing-Dependencies)
- [Running Migrations & Seeds](#Running-Migrations-and-Seeds)
- [Starting the Application](#Starting-The-Application)


## [How to run the tests](#Running-Rspec-Tests)


# Running The Project Locally

## Installing Ruby & Rails

### Installing Ruby
First of all in order to install ruby. Head to the [official Ruby website](https://www.ruby-lang.org/en/downloads/) and refer to the "Ways of Installing Ruby" section.

After making sure that Ruby is installed You can test to see if it's working by typing `ruby -v` in the command line.

You also need to install the `bundler` gem which will be used later to manage & install dependencies. You can install it by running `gem install bundler`.

### Installing Rails
Now to install Rails all you have to do is run `gem install rails` and you're good to go to the next step.

## Cloning This Repository

- To clone using **SSH** run `git clone git@github.com:Bismarck-GM/lifestyle-articles.git`
- To clone using **HTTP** run `git clone https://github.com/Bismarck-GM/lifestyle-articles.git`

Note: In case you don't have [Git](https://git-scm.com/downloads) Installed. You can download this repo using [this link](https://github.com/WinterCore/rails-capstone-potato/archive/development.zip)


## Installing & configuring postgres

### Installing postgres
Different guides based on operating systems.
- [Ubuntu](https://www.postgresql.org/download/linux/ubuntu/)
- [Arch Linux](https://wiki.archlinux.org/index.php/PostgreSQL)
- [Debian](https://wiki.debian.org/PostgreSql)
- [Windows](https://www.guru99.com/download-install-postgresql.html)

### Creating a new postgres user

Create a new postgres superuser with the same name as your username by using the `createuser --interactive` command and when prompted whether you want the user to be a super user enter `y`.

You can get your current username by running `whoami` on linux based systems.

Sometimes you may get an error "Fatal: role "your username” does not exist", which means that your user isn't allowed to create other users and in that case you may need to switch to the `postgres` user before running the command again. Refer to this [stackoverflow answer](https://stackoverflow.com/a/11919677) for more details.

### Creating the project's database

Lastly. You need to create a database with the name `potato_development`. You can do that by running the following command `createdb potato_development -O <your username>`. The `-O` flag sets the owner of the database (Don't forget to replace `<your username>` with your actual username)

### Configuring postgres

Changing postgres to development mode (this makes it easier to connect to the database and create and drop databases in order to run the tests)

Look for a postgres config file called `pg_hba.conf`. The location of the file is different on each operating system. So you may have to do some googling.

Add the following lines to the `pg_hba.conf` file

```conf
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
```
These lines instruct postgres to not require a password from connections made from localhost.

To find more details about this config file visit [this link](https://www.postgresql.org/docs/10/auth-pg-hba-conf.html)


## Installing Dependencies

You can install the project's dependencies by running `bundle install` in the root directory of the porject.
Note: Running this command might take some time. So feel free to go make some coffee or do any activity.

## Running Migrations and Seeds

You can migrate the database by running `rails db:migrate`.
For this project to work it's necesary to run the seeds: `rails db:seed`.
Note: Make sure to run both commands in the root directory of the project.

## Starting The Application

And finally after all the hard work. You can start the application by running `rails s`.
You can access the app by typing `http://127.0.0.1:3000` in the browser.


# Running Rspec Tests

First of all you need to create the test database. You can do that by running the following command.
```bash
createdb lifestyle_test -O <your username>
```
If that doesn't work, refer to the [Installing & configuring postgres](#Installing--configuring-postgres) and [Creating the project's database](#Creating-the-projects-database).

Lastly. Running the tests is as simple as running `bundle exec rspec spec` in the root directory of this project.

Thanks Hasan (@wintercore) for this HOW TO !