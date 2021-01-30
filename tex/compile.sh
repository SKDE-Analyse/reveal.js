#/usr/bin/env bash

for i in *.tex; do
#pdflatex $i
#pdflatex $i
#pdfcrop ${i%.*}.pdf && mv ${i%.*}-crop.pdf ${i%.*}.pdf
convert ${i%.*}.pdf ${i%.*}.png;
#rm -rf ${i%.*}.pdf
rm -rf ${i%.*}.aux
rm -rf ${i%.*}.log
rm -rf ${i%.*}.fls
rm -rf ${i%.*}.fdb_latexmk
rm -rf ${i%.*}.*.gz

echo '''<section data-auto-animate data-background-image="img/bg_wide.png">
<div class="twocolumn">
<div>
<span>
<pre><code data-trim data-noescape class="tex" data-line-numbers="">''' > ${i%.*}.html
cat $i >> ${i%.*}.html
echo "
</code></pre>
</div>
<div>
<img src=\"tex/${i%.*}.png\">
</div>	
</div>
</section>
" >> ${i%.*}.html

done
