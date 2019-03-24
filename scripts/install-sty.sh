#!/bin/bash

echo "Instalation de palettechum.sty dans votre dossier texmf."
dossiercibleinst=~/texmf/tex/latex/palettechum
echo $dossiercibleinst
if test -d $dossiercibleinst
then
	echo "Le dossier $dossiercibleinst existe déjà"
	read -p "Voulez vous le suprimer (o/n)? " repsuprdoss

	if test $repsuprdoss == "o"
	then
		rm -R $dossiercibleinst
	else
		exit 1
	fi
fi

mkdir $dossiercibleinst
if cp ../Palettes/palettechum.sty $dossiercibleinst/
then
	echo "Instalation terminée."
fi

