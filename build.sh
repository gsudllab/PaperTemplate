
dir="aaai"

if [[ $# > 0 ]]
then
    dir=$1
fi

sed '/#body#/{
    s/#body#//g
    r body.tex
    }' $dir/template.tex > $dir/main.tex

cp $dir/main.tex main_$dir.tex
cp ref.bib $dir/

texify --pdf --tex-option=--interaction=errorstopmode --tex-option=--synctex=1 $dir/main.tex

cp $dir/main.pdf main_$dir.pdf
