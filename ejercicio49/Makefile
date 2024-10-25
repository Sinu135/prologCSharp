# Makefile para el programa Prolog ejercicio49.pl

# Nombre del archivo Prolog
PROLOG_FILE = ejercicio49.pl

# Objetivo por defecto
all: run

# Ejecutar el programa Prolog con la consulta sym_cbal_trees(3, Ts)
run:
	swipl -s $(PROLOG_FILE) -g "N=3, sym_cbal_trees(N, Trees), write(Trees), nl." -t halt

# Limpiar archivos generados
clean:
	@rm -f *.o *~ 
