# 1) Nombre: ANDRES GUTIERREZ ARCIA ID:402310453 correo: andres.gutierrez.arcia@gmail.com HORARIO: 01 pm
# 2) Nombre: ADRIAN PRENDAS ARAYA ID:604140420 correo: a6r2an@gmail.com HORARIO: 01 pm
# 3) Nombre: CARLOS MURILLO BADILLA ID:402360192 correo: cmb2897@gmail.com HORARIO: 01 pm
# 4) Nombre: JOAQUÍN ALEJANDRO SÁNCHEZ BARBOZA ID:114160575 correo: j.alejandro.1290@gmail.com HORARIO: 01 pm

clear
echo -e "\r\n*** Generating  Graphviz and Prolog for study plan ***\r\n"
echo "Paradigmas de Programacion 2018 - 1pm"
echo -e "- Andres Gutierrez Arcia \t - Adrian Prendas Araya"
echo -e "- Carlos Murillo Badilla \t - Joaquin Alejandro Sanchez Barboza"

echo -e "\r\n*** Generando Composed Plan ***"
echo -e "Codigo Fuente: \t\t src/compose.awk"
echo -e "Archivo de Entrada: \t\t study_plan_input/study_plan.txt"
echo -e "Archivo de Salida: \t\t compose_output/composed_plan.txt"
awk -f src/compose.awk study_plan_input/study_plan.txt > compose_output/composed_plan.txt

retVal=$?
if [ $retVal -ne 0 ]; then
   exit $retVal
fi

echo -e "\r\n*** Generando Prolog ***"
echo -e "Codigo Fuente: \t\t src/genprolog.awk"
echo -e "Archivo de Entrada: \t\t compose_output/composed_plan.txt"
echo -e "Archivo de Salida: \t\t prolog_output/study_plan.pl"
awk -f src/genprolog.awk compose_output/composed_plan.txt > prolog_output/study_plan.pl

retVal=$?
if [ $retVal -ne 0 ]; then
   exit $retVal
fi

echo -e "\r\n*** Generando Grafos *** "
echo -e "Codigo Fuente: \t\t src/gengraph.awk"
echo -e "Archivo de Entrada: \t\t compose_output/composed_plan.txt"
###############################################################################################
choice=""
while [ "$choice" != "q" ]
do
        echo
        echo "Seleccionar una opcion de Grafo"
        echo "1) Todos los cursos"
        echo "2) Cursos EIF y EIG"
        echo "3) Cursos EIF y MAY"
        echo "4) Cursos EIF, EIG y Optativos"
        echo "q) Salir"
        echo

        read choice
# Windows: start | linux: firefox
# start/firefox <path>;;
        case $choice in
            '1')
              echo -e "Archivo Generado: \t\t gv_output/study_plan.pdf"
              awk -f src/gengraph.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan.pdf
              ;;
            '2')
              echo -e "Archivo Generado: \t\t gv_output/study_plan_EIFEIG.pdf"
              awk -f src/gengraph_EIF.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIFEIG.pdf
              ;;
            '3')
              echo -e "Archivo Generado: \t\t gv_output/study_plan_EIFMAY.pdf"
              awk -f src/gengraph_EIFMAY.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIFMAY.pdf
              ;;
            '4')
              echo -e "Archivo Generado: \t\t gv_output/study_plan_EIFEIGOPT.pdf"
              awk -f src/gengraph_EIFOPT.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIFEIGOPT.pdf
              ;;
            'q')
              echo -e "Programa Finalizado\r\n"
              ;;
            *)
              echo "Esta opcion no esta disponible"
              ;;
        esac
done
