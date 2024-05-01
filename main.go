package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

var uri = ""

func main() {

	db, err := sql.Open("postgres", uri)
	if err != nil {
		fmt.Print(err)
	}

	err = db.Ping()

	if err != nil {
		fmt.Print(err)
	}
	log.Println("Connected to Postgres!")

}
