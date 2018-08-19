clear
echo -e "\r\n*** Generating  Graphviz and Prolog for study plan ***\r\n"
echo "Paradigmas de Programacion 2018 - 1pm"
echo -e "- Andres Gutierrez Arcia \t - Adrian Prendas Araya"
echo -e "- Carlos Murillo Badilla \t - Joaquin Alejandro Sanchez Barboza"

echo -e "\r\n*** Generating composed plan ***"
echo -e "Processing File: \t src/compose.awk"
echo -e "Input File: \t\t study_plan_input/study_plan.txt"
echo -e "Output File: \t\t compose_output/composed_plan.txt"
awk -f src/compose.awk study_plan_input/study_plan.txt > compose_output/composed_plan.txt
#
retVal=$?
if [ $retVal -ne 0 ]; then
   exit $retVal
fi
#
echo -e "\r\n*** Generating Graphviz *** "
echo -e "Processing File: \t src/gengraph.awk"
echo -e "Input File: \t\t compose_output/composed_plan.txt"
echo -e "Output File: \t\t gv_output/study_plan.pdf"
###############################################################################################
choice=""
while [ "$choice" != "q" ]
do
        echo
        echo "Seleccionar una opcion!"
        echo "1) Todos los cursos"
        echo "2) Cursos EIF"
        echo "3) Cursos EIF y MAY"
        echo "4) Cursos EIF y Optativos"
        echo "q) Continuar con Prolog"
        echo

        read choice

        case $choice in
            '1') awk -f src/gengraph.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan.pdf && firefox gv_output/study_plan.pdf ;;
            '2') awk -f src/gengraph_EIF.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIF.pdf  && firefox gv_output/study_plan_EIF.pdf;;
            '3') awk -f src/gengraph_EIFMAY.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIFMAY.pdf && firefox gv_output/study_plan_EIFMAY.pdf;;
            '4') awk -f src/gengraph_EIFOPT.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan_EIFOPT.pdf && firefox gv_output/study_plan_EIFOPT.pdf;;
            'q') echo "Continuando con Prolog!";;
            *)   echo "menu item is not available; try again!";;
        esac
done
###############################################################################################

#
retVal=$?
if [ $retVal -ne 0 ]; then
   exit $retVal
fi
#
echo -e "\r\n*** Generating Prolog ***"
echo -e "Processing File: \t src/genprolog.awk"
echo -e "Input File: \t\t compose_output/composed_plan.txt"
echo -e "Output File: \t\t prolog_output/study_plan.pl"
#awk -f src/genprolog.awk compose_output/composed_plan.txt > prolog_output/study_plan.pl
#
echo -e "\r\nEND OF PROGRAM\r\n"
