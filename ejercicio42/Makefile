# Define variables
PROLOG = swipl
SOURCE = ejercicio42.pl

# Default target
all: run

# Rule to run the Prolog file and print output to the terminal
run:
	$(PROLOG) -s $(SOURCE) -g "table(true, true, and(true, true)), table(true, false, and(true, false)), table(false, true, and(false, true)), table(false, false, and(false, false)), halt."

# Clean up (not strictly necessary in this case)
clean:
	@echo "Nothing to clean."
