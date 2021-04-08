package game

import (
	"context"
	"gomud/pkg/core"
)

var globalActions = map[string]func(context.Context, core.Entity, []string) error{
	"qq":   quit,
	"quit": quit,
}
