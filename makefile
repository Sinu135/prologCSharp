# Makefile para ejecutar todos los makefiles de ejercicio1 a ejercicio30

# Definir la lista de ejercicios
EJERCICIOS = ejercicio1 ejercicio2 ejercicio3 ejercicio4 ejercicio5 \
             ejercicio6 ejercicio7 ejercicio8 ejercicio9 ejercicio10 \
             ejercicio11 ejercicio12 ejercicio13 ejercicio14 ejercicio15 \
             ejercicio26 ejercicio27 ejercicio28 ejercicio29 ejercicio30 \
			 ejercicio31 ejercicio32 ejercicio33 ejercicio34 ejercicio35 \
             ejercicio36 ejercicio37 ejercicio38 ejercicio39 ejercicio40 \
             ejercicio41 ejercicio42 ejercicio43 ejercicio44 ejercicio45 \
             ejercicio46 ejercicio47 ejercicio48 ejercicio49 ejercicio50 \

EJERCICIOS3150 = ejercicio31 ejercicio32 ejercicio33 ejercicio34 ejercicio35 \
             ejercicio36 ejercicio37 ejercicio38 ejercicio39 ejercicio40 \
             ejercicio41 ejercicio42 ejercicio43 ejercicio44 ejercicio45 \
             ejercicio46 ejercicio47 ejercicio48 ejercicio49 ejercicio50 \



.PHONY: all run clean

# Objetivo por defecto

all: run50
# Ejecutar make run en cada directorio de ejercicios
run50:
	@for dir in $(EJERCICIOS); do \
		$(MAKE) -C $$dir run; \
	done

run3150:
	@for dir in $(EJERCICIOS3150); do \
		$(MAKE) -C $$dir run; \
	done

# Limpiar (opcional, si deseas añadir esta funcionalidad)
clean:
	@for dir in $(EJERCICIOS); do \
		$(MAKE) -C $$dir clean; \
	done

