package hello

import (
	"testing"
)

func TestSetAndGet(t *testing.T) {
	// Test initial state
	if got := Get(); got != "Hello, Gno!" {
		t.Errorf("Expected default message, got %s", got)
	}

	// Test setting a new message
	Set(cross, "Hello, Test!")
	if got := Get(); got != "Hello, Test!" {
		t.Errorf("Expected 'Hello, Test!', got %s", got)
	}
}
