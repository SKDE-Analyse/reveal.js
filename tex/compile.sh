#/usr/bin/env bash

for i in *.tex; do

convert ${i%.*}.pdf -colorspace RGB ${i%.*}.png;

linenum=`head -1 ${i%.*}.tex | cut -c2-`

echo "<section data-auto-animate data-background-image=\"img/bg_wide.png\">
<div class=\"twocolumn\">
<div>
<span>
<pre><code data-trim data-noescape class=\"tex\" data-line-numbers=\"${linenum}\">" > ${i%.*}.html
tail -n +2 $i >> ${i%.*}.html
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

rm -rf *.aux
rm -rf *.log
rm -rf *.fls
rm -rf *.fdb_latexmk
rm -rf *.gz
rm -rf *.blg
rm -rf *.bcf
rm -rf *.bbl
rm -rf *.toc
rm -rf *.xml

