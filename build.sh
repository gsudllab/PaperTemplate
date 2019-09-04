
dir="aaai"

if [[ $# > 0 ]]
then
    dir=$1
fi

sed '/#body#/{
    s/#body#//g
    r body.tex
    }' $dir/template.tex > $dir/main.tex

if [[ $dir == 'iclr' ]]
then
    sed -i '/newcommand{\\vs/d;/newcommand{\\ve/d' $dir/main.tex
fi

cp $dir/main.tex main_$dir.tex
cp ref.bib $dir/

texify --pdf --tex-option=--interaction=errorstopmode --tex-option=--synctex=1 $dir/main.tex

cp $dir/main.pdf main_$dir.pdf
