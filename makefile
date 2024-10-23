# Makefile para ejecutar todos los makefiles de ejercicio1 a ejercicio30

# Definir la lista de ejercicios
EJERCICIOS = ejercicio1 ejercicio2 ejercicio3 ejercicio4 ejercicio5 \
             ejercicio6 ejercicio7 ejercicio8 ejercicio9 ejercicio10 \
             ejercicio11 ejercicio12 ejercicio13 ejercicio14 ejercicio15 \
             ejercicio16 ejercicio17 ejercicio18 ejercicio19 ejercicio20 \
             ejercicio21 ejercicio22 ejercicio23 ejercicio24 ejercicio25 \
             ejercicio26 ejercicio27 ejercicio28 ejercicio29 ejercicio30

.PHONY: all run clean

# Objetivo por defecto
all: run

# Ejecutar make run en cada directorio de ejercicios
run:
	@for dir in $(EJERCICIOS); do \
		$(MAKE) -C $$dir run; \
	done

# Limpiar (opcional, si deseas añadir esta funcionalidad)
clean:
	@for dir in $(EJERCICIOS); do \
		$(MAKE) -C $$dir clean; \
	done

