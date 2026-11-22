# Celestial Bodies Database

A PostgreSQL relational database designed to organize information about galaxies, stars, planets, moons, and spacecraft.

This project was completed as part of the **freeCodeCamp Relational Database Certification**. It demonstrates relational database design, SQL data manipulation, primary and foreign keys, constraints, and table relationships.

## Project Overview

The `universe` database contains five related tables representing celestial objects and space exploration missions.

The database was designed to meet the project requirements while demonstrating practical SQL and PostgreSQL skills.

## Database Schema

| Table | Description | Records |
|---|---|---:|
| `galaxy` | Stores galaxy information | 6 |
| `star` | Stores stars and their associated galaxies | 7 |
| `planet` | Stores planets and their associated stars | 15 |
| `moon` | Stores natural satellites and their associated planets | 20 |
| `spacecraft` | Stores spacecraft and mission information | 5 |
| **Total** | **5 tables** | **53** |

## Entity Relationships

The database uses foreign keys to establish the following relationships:

- **Galaxy → Star:** Each star references a galaxy through `galaxy_id`.
- **Star → Planet:** Each planet references a star through `star_id`.
- **Planet → Moon:** Each moon references a planet through `planet_id`.

These relationships maintain referential integrity and allow related records to be retrieved using SQL JOIN operations.

## Database Design and SQL Concepts

The project demonstrates the following PostgreSQL features:

- Database creation and connection
- Relational table design
- Primary keys using auto-incrementing `SERIAL` columns
- Foreign key constraints
- `NOT NULL` and `UNIQUE` constraints
- Data types including `INT`, `NUMERIC`, `VARCHAR`, `TEXT`, and `BOOLEAN`
- Data insertion using `INSERT INTO`
- Data retrieval using `SELECT`
- Sorting records using `ORDER BY`
- Combining related data using `JOIN`
- Database inspection using PostgreSQL meta-commands

## Technologies Used

- PostgreSQL
- SQL
- Visual Studio Code
- Docker
- freeCodeCamp CodeRoad

## How to Run the Project

### Prerequisites

- PostgreSQL installed
- Access to a PostgreSQL terminal (`psql`)

### Restore the Database

1. Download or clone this repository.
2. Open a terminal in the project directory.
3. Restore the database using:

```bash
psql -U postgres -f universe.sql
```

The SQL dump was generated using PostgreSQL's `pg_dump` utility and includes the database creation and restoration commands.

4. Connect to the database:

```sql
\c universe
```

5. Inspect the tables:

```sql
\dt
```

6. View table structures:

```sql
\d galaxy
\d star
\d planet
\d moon
\d spacecraft
```

## Example Queries

### Retrieve stars and their galaxies

```sql
SELECT star.name, galaxy.name AS galaxy
FROM star
JOIN galaxy USING (galaxy_id);
```

### Retrieve planets and their host stars

```sql
SELECT planet.name, star.name AS star
FROM planet
JOIN star USING (star_id);
```

### Retrieve moons and their parent planets

```sql
SELECT moon.name, planet.name AS planet
FROM moon
JOIN planet USING (planet_id);
```

## Project File

- `universe.sql` — SQL dump containing the database schema, constraints, and sample records.

## Learning Outcomes

Through this project, I practiced:

- Designing relational database schemas.
- Establishing relationships between multiple tables.
- Implementing primary keys, foreign keys, and data integrity constraints.
- Working with different PostgreSQL data types.
- Inserting and querying relational data.
- Retrieving related records using JOIN operations.
- Exporting databases using `pg_dump`.

## Certification

Completed as part of the **freeCodeCamp Relational Database Certification**.

[freeCodeCamp](https://www.freecodecamp.org/learn/relational-database/)
