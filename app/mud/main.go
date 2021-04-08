package main

import (
	"context"
	"fmt"
	"gomud/pkg/api"
	"gomud/pkg/db"
	"gomud/pkg/game"
	"os"
	"os/signal"

	_ "github.com/denisenkom/go-mssqldb"
)

// This example demonstrates a trivial echo server.
func main() {
	fmt.Println("hi")
	ctx, ctxDone := context.WithCancel(context.Background())
	defer ctxDone()
	db.Setup(ctx)
	g, err := game.New(ctx)
	if err != nil {
		fmt.Println(err)
	}
	go api.Start(g)
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	s := <-c
	fmt.Println("Got signal: " + s.String() + " now closing")
}
