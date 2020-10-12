# Airport departure board app

This app simulates airport departure board. Uses rails under the hood and decoupled microservice to run airplanes.

## Run

Run airport app:
```shell
$ git clone git@github.com:askuratovsky/airport.git
$ cd airport
$ cp .env.sample .env
$ make run
```

Run airhub app:
```shell
$ git clone git@github.com:askuratovsky/airhub.git
$ cd airhub
$ make run
```

Open <http://localhost:3000>

## Details

Original [task description][statementlink]

See [cover letter][cover]

---
[statementlink]: docs/ror_test.pdf
[cover]: docs/cover
