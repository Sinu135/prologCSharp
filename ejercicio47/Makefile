# Define variables
PROLOG = swipl
SOURCE = ejercicio47.pl

# Default target
all: run

# Rule to run the Prolog file and print output to the terminal
run:
	$(PROLOG) -s $(SOURCE) -g "check_symmetric(t(1, t(2, t(3, nil, nil), t(4, nil, nil)), t(2, t(4, nil, nil), t(3, nil, nil)))), halt."

# Clean up (not strictly necessary in this case)
clean:
	@echo "Nothing to clean."
