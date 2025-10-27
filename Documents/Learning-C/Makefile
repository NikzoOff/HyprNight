# Makefile for C Learning - Works with subdirectories
# Usage:
#   make run FILE=2-Advanced/1-Pointers     - Compile and run specific file
#   make compile FILE=2-Advanced/1-Pointers - Just compile
#   make all                                - Compile all .c files
#   make clean                              - Remove all compiled files

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -g
LDFLAGS = -lm

# Output directory for executables
BUILD_DIR = build

# Find all .c files recursively
SOURCES = $(shell find . -name "*.c" -not -path "./build/*")

# Default target - show help
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run FILE=<path>       - Compile and run (e.g., make run FILE=2-Advanced/1-Pointers)"
	@echo "  make compile FILE=<path>   - Just compile"
	@echo "  make all                   - Compile all C files"
	@echo "  make clean                 - Remove all compiled files"
	@echo "  make list                  - List all C files"
	@echo ""
	@echo "Examples:"
	@echo "  make run FILE=2-Advanced/1-Pointers"
	@echo "  make run FILE=1-Basics/3-arrays"

# Run a specific file (compile if needed)
.PHONY: run
run:
ifndef FILE
	@echo "Error: Specify FILE=<path>"
	@echo "Example: make run FILE=2-Advanced/1-Pointers"
else
	@mkdir -p $(BUILD_DIR)
	@echo "Compiling $(FILE).c..."
	@$(CC) $(CFLAGS) "$(FILE).c" -o $(BUILD_DIR)/temp_exec $(LDFLAGS) && \
	echo "✓ Compilation successful\n" && \
	echo "=== Running $(FILE) ===" && \
	$(BUILD_DIR)/temp_exec
endif

# Just compile (no run)
.PHONY: compile
compile:
ifndef FILE
	@echo "Error: Specify FILE=<path>"
	@echo "Example: make compile FILE=2-Advanced/1-Pointers"
else
	@mkdir -p $(BUILD_DIR)
	@echo "Compiling $(FILE).c..."
	@$(CC) $(CFLAGS) "$(FILE).c" -o $(BUILD_DIR)/$(notdir $(FILE)) $(LDFLAGS)
	@echo "✓ Created executable: $(BUILD_DIR)/$(notdir $(FILE))"
endif

# Compile all files
.PHONY: all
all:
	@mkdir -p $(BUILD_DIR)
	@echo "Compiling all C files..."
	@for file in $(SOURCES); do \
		filename=$$(basename $$file .c); \
		echo "  Compiling $$file..."; \
		$(CC) $(CFLAGS) $$file -o $(BUILD_DIR)/$$filename $(LDFLAGS) || exit 1; \
	done
	@echo "✓ All files compiled to $(BUILD_DIR)/"

# Clean up compiled files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)
	@rm -f test
	@echo "✓ All executables removed"

# List all available C files
.PHONY: list
list:
	@echo "Available C files:"
	@find . -name "*.c" -not -path "./build/*" | sed 's|^\./||' | sed 's|\.c$$||' | sort
