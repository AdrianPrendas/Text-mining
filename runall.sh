#! /usr/bin/bash
# loriacarlos@gmail.com
#
echo "*** Generating  Graphviz and Prolog for study plan ***"
#
echo "*** Generating composed plan ***"
gawk -f src/compose.awk study_plan_input/study_plan.txt > compose_output/composed_plan.txt
#
retVal=$?
if [ $retVal -ne 0 ]; then 
   exit $retVal
fi
#
echo "*** Generating Graphviz *** "
gawk -f src/gengraph.awk compose_output/composed_plan.txt | dot -Tpdf -o gv_output/study_plan.pdf
#
retVal=$?
if [ $retVal -ne 0 ]; then 
   exit $retVal
fi
#
echo "*** Generating Prolog ***"
gawk -f src/genprolog.awk compose_output/composed_plan.txt > prolog_output/study_plan.pl
#
