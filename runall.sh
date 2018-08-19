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
awk -f src/gengraph.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan.pdf
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
awk -f src/genprolog.awk compose_output/composed_plan.txt > prolog_output/study_plan.pl
#
echo -e "\r\nEND OF PROGRAM\r\n"
