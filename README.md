![plan](https://user-images.githubusercontent.com/16330583/44313725-a9a9d100-a3ca-11e8-82e8-9a5b2289e323.png)
![p0_a](https://user-images.githubusercontent.com/16330583/44546355-e6304200-a6d4-11e8-93a0-0c1ba32641ab.png)
<hr>

<h1>Text-Mining</h1>

<h2>Acerca del proyecto</h2>
<p>Al ejecutar el archivo runall.sh, toma el plan de estudios de la carrera de Ingenieria de sistemas de la Universidad Nacional de Costa Rica el cual esta en formato .txt para luego procesarlo utilizando awk y generando un archivo compose.txt, que es el mismo plan de estudios pero mejor ordenado, poniendo cada curso, sus requisitos, nivel y ciclo por cada linea para facilitar el procesamiento del siguiente paso, que consite en generar un grafo con Graphviz donde se puede mostrar los cursos como nodos y las aristas como requisitos hacia otros cursos. Además, es posible indicar lo que se quiere generar, como por ejemplo, mostrar solo los cursos de carrera. Del mismo modo al ultimo procedimiento, se genera un archivo Prolog, al cual se le pueden realizar consultas al plan de estudios, como listar los requisitos que no son requisitos para otros cursos (hojas)</p>

<hr>

<h2>Pasos</h2>
<ol>
  <li> <b>f(x):</b> donde <b>x</b> es el plan de estudios (.txt) y <b>f(x)</b> es el archivo compose.txt generado</li>
  <li> <b>g(f(x)):</b> donde <b>f(x)</b> es el archivo compose.txt generado y <b>g(f(x))</b> es el grafo seleccionado generado</li>
  <li> <b>h(f(x)):</b> donde <b>f(x)</b> es el archivo compose.txt generado y <b>h(f(x))</b> es el archivo Prolog generado</li>
</ol>


<hr>

<h2>Instrucciones</h2>
  <ul>
    <li> Ejecutar el archivo <b> runall</b> </li>
      <ul>
        <li> En la consola, ejecutar el siguiente comando "./runall.sh" </li>
      </ul>
  </ul>
  
<hr>

<ul>
  <h4><span>Devs:</span></h4>
  <li> <b>Nombre:</b> ANDRES GUTIERREZ ARCIA ID:402310453 <b>correo:</b> andres.gutierrez.arcia@gmail.com <b>HORARIO:</b> 01 pm <l/i> 
  <li> <b>Nombre:</b> ADRIAN PRENDAS ARAYA ID:604140420 <b>correo:</b> a6r2an@gmail.com <b>HORARIO:</b> 01 pm </li> 
  <li> <b>Nombre:</b> CARLOS MURILLO BADILLA ID:402360192 <b>correo:</b> cmb2897@gmail.com <b>HORARIO:</b> 01 pm </li> 
  <li> <b>Nombre:</b> JOAQUÍN ALEJANDRO SÁNCHEZ BARBOZA ID:114160575 <b>correo:</b> j.alejandro.1290@gmail.com <b>HORARIO:</b> 01 pm </li> 
</ul>
